require 'data/order/studentsorder'
require 'expression'

class FirstYearScholarshipAssignmentOrder < StudentsOrder
	TYPE = 'О назначении на стипендию студентов 1 семестра 1 курса'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( scholarship_id ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state"=>"studying", "liabilities"=>false}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'scholarship_id' => 7
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForFirstYearScholarshipAssignmentOrder.has_order?
			fixed_attrs = DetailsForFirstYearScholarshipAssignmentOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForFirstYearScholarshipAssignmentOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

		end
	end
end
