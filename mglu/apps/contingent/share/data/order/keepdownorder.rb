require 'data/order/studentsorder'
require 'expression'

class KeepDownOrder < StudentsOrder
	TYPE = 'О предоставлении повторного обучения на платной основе'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( study_type_id degree_code liabilities group_id card_number profession_code ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"student_state_id"=>Classifier::StudentState::STUDYING}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'study_type_id' => Classifier::StudyType::CONTRACT
		}

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'degree_code' => attributes['degree_code'],
				'liabilities' => (not attributes['liabilities'].empty?),
				'group_id' => attributes['group_id'],
				'card_number' => attributes['card_number'],
				'profession_code' => attributes['profession_code']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForKeepDownOrder.has_order?
			fixed_attrs = DetailsForKeepDownOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForKeepDownOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['degree_code'].empty?), 'Поле "Новая ступень образования" не определено' if attributes['degree_code'].empty?
			raise error(:activation, (not fixed_attrs['liabilities'].empty?).empty?), 'Поле "Академические задолженности" не определено' if (not attributes['liabilities'].empty?).empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Присвоить номер л.д." не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['profession_code'].empty?), 'Поле "Код направления / специальности (новый)" не определено' if attributes['profession_code'].empty?
		end
	end
end
