require 'data/order/studentsorder'
require 'expression'

class IndividualScholarshipAssignmentOrder < StudentsOrder
	TYPE = 'О назначении на индивидуальную стипендию'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( scholarship_id ),
	}

	public_class_method :new

	def title
		conditions = DetailsForIndividualScholarshipAssignmentOrder.order_conditions(self)
		return %(О назначении на стипендию) if not conditions['grant']
		return %(О назначении на грант) if conditions['grant']
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
			'scholarship_id' => attributes['scholarship_id']
		}

	end

	def try_to_activate
		super

		if DetailsForIndividualScholarshipAssignmentOrder.has_order?
			fixed_attrs = DetailsForIndividualScholarshipAssignmentOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

			raise error(:activation, fixed_attrs['scholarship_id'].empty?), 'Поле "Вид стипендии" не определено' if attributes['scholarship_id'].empty?
		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForIndividualScholarshipAssignmentOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

		end
	end
end
