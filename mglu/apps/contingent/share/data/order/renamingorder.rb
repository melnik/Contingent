require 'data/order/studentsorder'
require 'expression'

class RenamingOrder < StudentsOrder
	TYPE = 'Об изменении фамилии, имени или отчества обучающегося'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( first_name last_name father_name ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state"=>"studying"}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'first_name' => attributes['name']['first'],
				'last_name' => attributes['name']['last'],
				'father_name' => attributes['name']['father']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForRenamingOrder.has_order?
			fixed_attrs = DetailsForRenamingOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForRenamingOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['name']['first'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['first'].empty?
			raise error(:activation, fixed_attrs['name']['last'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['last'].empty?
			raise error(:activation, fixed_attrs['name']['father'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['father'].empty?
		end
	end
end
