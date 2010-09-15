require 'data/order/studentsorder'
require 'expression'

class RestorationOrder < StudentsOrder
	TYPE = 'О восстановлении в МГЛУ'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( degree_code student_state_id study_type_id liabilities specialization_code group_id card_number profession_code ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state_id"=>Classifier::StudentState::EXPELLED}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'degree_code' => attributes['degree_code'],
			'student_state_id' => Classifier::StudentState::STUDYING,
			'study_type_id' => attributes['study_type_id']
		}

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'liabilities' => (not attributes['liabilities'].empty?),
				'specialization_code' => attributes['specialization_code'],
				'group_id' => attributes['group_id'],
				'card_number' => attributes['card_number'],
				'profession_code' => attributes['profession_code']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForRestorationOrder.has_order?
			fixed_attrs = DetailsForRestorationOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

			raise error(:activation, fixed_attrs['degree_code'].empty?), 'Поле "Ступень высшего профессионального образования" не определено' if attributes['degree_code'].empty?
			raise error(:activation, fixed_attrs['study_type_id'].empty?), 'Поле "Форма (основа) обучения" не определено' if attributes['study_type_id'].empty?
		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForRestorationOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, (not fixed_attrs['liabilities'].empty?).empty?), 'Поле "Академические задолженности" не определено' if (not attributes['liabilities'].empty?).empty?
			raise error(:activation, fixed_attrs['specialization_code'].empty?), 'Поле "Код специализации" не определено' if attributes['specialization_code'].empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Новый &#x2116; л.д." не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['profession_code'].empty?), 'Поле "Новый код направления / специальности" не определено' if attributes['profession_code'].empty?
		end
	end
end
