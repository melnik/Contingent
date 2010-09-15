require 'data/order/studentsorder'

class AdjustVacationOrder < StudentsOrder
	TYPE = 'О понижении номера курса для всех студентов, находящихся в академическом отпуске'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( group_id ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state_id"=>Classifier::StudentState::VACATION}

	##
	# CAUTION: do not regenerate - this routine will be lost
	#
	# Automatically fills up the order with students
	def initialize oid, params = nil
		super

		search_available QUALIFIED_STUDENTS, %w( student_id department current_term_number group_num ) do |student_id, department, term_number, group_number|
			add [ student_id ]

			begin
				set_student_attributes student_id, {
					'group_id' => Group.load("#{department}-#{term_number - 2}#{group_number}").oid,
				}
			rescue # shit happend (most likely group not found)
			end
		end
	end

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'group_id' => attributes['group_id']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			defaults = DetailsForAdjustVacationOrder.fix_student(self, student_id, paragraph_id, attributes)

			if attributes['group_id'].empty? then
				if @auto_fix then
					attributes['group_id'] = defaults['group_id']

					set_student_attributes student_id, attributes
				else
					raise error(:activation, false, { 'student_ids' => [ student_id ] }), 'поле "Числить в группе" не определено'
				end
			end
		end
	end
end
