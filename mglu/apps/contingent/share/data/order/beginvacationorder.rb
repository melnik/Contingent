require 'data/order/studentsorder'
require 'expression'

class BeginVacationOrder < StudentsOrder
	TYPE = 'О предоставлении академических отпусков'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( student_state_id ),
	}

	public_class_method :new

	def title
		conditions = DetailsForBeginVacationOrder.order_conditions(self)
		return %(О предоставлении отпуска по беременности и родам) if conditions['pregnancy']
		return %(О предоставлении отпуска по уходу за ребенком) if conditions['baby_minding']
		super
	end

	QUALIFIED_STUDENTS = {"student_state_id"=>Classifier::StudentState::STUDYING}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'student_state_id' => Classifier::StudentState::VACATION
		}

	end

	def try_to_activate
		super

		if DetailsForBeginVacationOrder.has_order?
			fixed_attrs = DetailsForBeginVacationOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForBeginVacationOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

		end
	end
end
