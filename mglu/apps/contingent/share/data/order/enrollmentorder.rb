require 'data/order/virtualstudentsorder'
require 'expression'

class EnrollmentOrder < VirtualStudentsOrder
	TYPE = 'О зачислении в МГЛУ'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( degree_code student_state_id study_type_id first_name last_name father_name citizenship_id specialization_code group_id card_number birth_date gender_id profession_code ),
	}

	public_class_method :new

	def title
		conditions = DetailsForEnrollmentOrder.order_conditions(self)
		return %(О зачислении целевым приемом в МГЛУ) if conditions['special']
		super
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
				'first_name' => attributes['name']['first'],
				'last_name' => attributes['name']['last'],
				'father_name' => attributes['name']['father'],
				'citizenship_id' => attributes['citizenship_id'],
				'specialization_code' => attributes['specialization_code'],
				'group_id' => attributes['group_id'],
				'card_number' => attributes['card_number'],
				'birth_date' => attributes['birth_date'],
				'gender_id' => attributes['gender_id'],
				'profession_code' => attributes['profession_code']
			}, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForEnrollmentOrder.has_order?
			fixed_attrs = DetailsForEnrollmentOrder.fix_order(self)
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
			fixed_attrs = DetailsForEnrollmentOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['name']['first'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['first'].empty?
			raise error(:activation, fixed_attrs['name']['last'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['last'].empty?
			raise error(:activation, fixed_attrs['name']['father'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['father'].empty?
			raise error(:activation, fixed_attrs['citizenship_id'].empty?), 'Поле "Гражданство" не определено' if attributes['citizenship_id'].empty?
			raise error(:activation, fixed_attrs['specialization_code'].empty?), 'Поле "Код специализации" не определено' if attributes['specialization_code'].empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Группа" не определено' if attributes['group_id'].empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Л.д. &#x2116;" не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['birth_date'].empty?), 'Поле "Дата рождения" не определено' if attributes['birth_date'].empty?
			raise error(:activation, fixed_attrs['gender_id'].empty?), 'Поле "Пол" не определено' if attributes['gender_id'].empty?
			raise error(:activation, fixed_attrs['profession_code'].empty?), 'Поле "Направление / специальность" не определено' if attributes['profession_code'].empty?
		end
	end
end
