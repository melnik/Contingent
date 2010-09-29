require 'data/order/studentsorder'
require 'expression'

class EndVacationOrder < StudentsOrder
	TYPE = 'О допуске к учебному процессу'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( student_state_id liabilities card_number group_id ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state_id"=>[Classifier::StudentState::VACATION, Classifier::StudentState::TRAINEE]}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'student_state_id' => Classifier::StudentState::STUDYING
		}.compact

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'liabilities' => (not attributes['liabilities'].empty?),
				'card_number' => attributes['card_number'],
				'group_id' => attributes['group_id']
			}.compact, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForEndVacationOrder.has_order?
			fixed_attrs = DetailsForEndVacationOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForEndVacationOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, (not fixed_attrs['liabilities'].empty?).empty?), 'Поле "Академические задолженности" не определено' if (not attributes['liabilities'].empty?).empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Присвоить № л.д." не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
		end
	end
end
