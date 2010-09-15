require 'data/order/studentsorder'
require 'expression'

class ExpelationOrder < StudentsOrder
	TYPE = 'Об отчислении'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( student_state_id liabilities group_id ),
	}

	public_class_method :new

	def title
		conditions = DetailsForExpelationOrder.order_conditions(self)
		return %(Об исключении из списочного состава) if conditions['dead']
		super
	end

	QUALIFIED_STUDENTS = {"student_state"=>"studying"}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'student_state_id' => Classifier::StudentState::EXPELLED
		}

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'liabilities' => (not attributes['liabilities'].empty?),
				'group_id' => nil
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForExpelationOrder.has_order?
			fixed_attrs = DetailsForExpelationOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForExpelationOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, (not fixed_attrs['liabilities'].empty?).empty?), 'Поле "Академические задолженности" не определено' if (not attributes['liabilities'].empty?).empty?
		end
	end
end
