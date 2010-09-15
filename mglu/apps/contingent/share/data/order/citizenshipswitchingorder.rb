require 'data/order/studentsorder'
require 'expression'

class CitizenshipSwitchingOrder < StudentsOrder
	TYPE = 'Об изменении гражданства'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( category citizenship_id study_type_id group_id card_number ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"category"=>"foreign", "student_state"=>"studying"}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'category' => Expression.new('category & ~1'),
			'citizenship_id' => 1,
			'study_type_id' => attributes['study_type_id']
		}

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'group_id' => attributes['group_id'],
				'card_number' => attributes['card_number']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForCitizenshipSwitchingOrder.has_order?
			fixed_attrs = DetailsForCitizenshipSwitchingOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

			raise error(:activation, fixed_attrs['study_type_id'].empty?), 'Поле "Новая форма (основа) обучения" не определено' if attributes['study_type_id'].empty?
		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForCitizenshipSwitchingOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Присвоить номер личного дела" не определено' if attributes['card_number'].empty?
		end
	end
end
