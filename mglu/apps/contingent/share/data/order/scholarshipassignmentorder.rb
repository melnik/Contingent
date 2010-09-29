require 'data/order/studentsorder'

class ScholarshipAssignmentOrder < StudentsOrder
	TYPE = 'О назначении на стипендию (академическую)'
	PARAGRAPH_NAME = [ 'Отл', 'Отл+хор', 'Хор' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( scholarship_id ),
	}

	public_class_method :new

	def title
		%(О назначении на стипендию)
	end

	QUALIFIED_STUDENTS = {"student_state"=>"studying", "liabilities"=>false}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super

		each_student 0, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'scholarship_id' => 2
			}, [ student_id ]
		end

		each_student 1, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'scholarship_id' => 1
			}, [ student_id ]
		end

		each_student 2, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'scholarship_id' => 1
			}, [ student_id ]
		end
	end

	def try_to_activate
		super
	end
end
