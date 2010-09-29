require 'data/order/studentsorder'
require 'expression'

class ProgramSwitchingOrder < StudentsOrder
	TYPE = 'О переходе с одной образовательной программы на другую'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( study_form_id degree_code specialization_code liabilities card_number group_id profession_code ),
	}

	public_class_method :new

	def title
		conditions = DetailsForProgramSwitchingOrder.order_conditions(self)
		return %(О переходе из одной учебной группы в другую) if not conditions['profession_switching']
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

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'study_form_id' => attributes['study_form_id'],
				'degree_code' => attributes['degree_code'],
				'specialization_code' => attributes['specialization_code'],
				'liabilities' => (not attributes['liabilities'].empty?),
				'card_number' => attributes['card_number'],
				'group_id' => attributes['group_id'],
				'profession_code' => attributes['profession_code']
			}.compact, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForProgramSwitchingOrder.has_order?
			fixed_attrs = DetailsForProgramSwitchingOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForProgramSwitchingOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['study_form_id'].empty?), 'Поле "Новая форма обучения" не определено' if attributes['study_form_id'].empty?
			raise error(:activation, fixed_attrs['specialization_code'].empty?), 'Поле "Новый код специализации" не определено' if attributes['specialization_code'].empty?
			raise error(:activation, (not fixed_attrs['liabilities'].empty?).empty?), 'Поле "Академические задолженности" не определено' if (not attributes['liabilities'].empty?).empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Присвоить номер л.д." не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
		end
	end
end
