require 'data/order/studentsorder'
require 'expression'

class EverythingModificationOrder < StudentsOrder
	TYPE = 'Об изменении учетных данных обучающегося'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( first_name last_name father_name degree_code citizenship_id card_number birth_date group_id gender_id profession_code study_type_id ),
	}

	public_class_method :new

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
				'first_name' => attributes['name']['first'],
				'last_name' => attributes['name']['last'],
				'father_name' => attributes['name']['father'],
				'degree_code' => attributes['degree_code'],
				'citizenship_id' => attributes['citizenship_id'],
				'card_number' => attributes['card_number'],
				'birth_date' => attributes['birth_date'],
				'group_id' => attributes['group_id'],
				'gender_id' => attributes['gender_id'],
				'profession_code' => attributes['profession_code'],
				'study_type_id' => attributes['study_type_id']
			}.compact, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForEverythingModificationOrder.has_order?
			fixed_attrs = DetailsForEverythingModificationOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForEverythingModificationOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['name']['first'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['first'].empty?
			raise error(:activation, fixed_attrs['name']['last'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['last'].empty?
			raise error(:activation, fixed_attrs['name']['father'].empty?), 'Поле "Ф.И.О." не определено' if attributes['name']['father'].empty?
			raise error(:activation, fixed_attrs['degree_code'].empty?), 'Поле "Ступень образования" не определено' if attributes['degree_code'].empty?
			raise error(:activation, fixed_attrs['citizenship_id'].empty?), 'Поле "Гражданство" не определено' if attributes['citizenship_id'].empty?
			raise error(:activation, fixed_attrs['card_number'].empty?), 'Поле "Л.д. &#x2116;" не определено' if attributes['card_number'].empty?
			raise error(:activation, fixed_attrs['birth_date'].empty?), 'Поле "Дата рождения" не определено' if attributes['birth_date'].empty?
			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Группа" не определено' if attributes['group_id'].empty?
			raise error(:activation, fixed_attrs['gender_id'].empty?), 'Поле "Пол" не определено' if attributes['gender_id'].empty?
			raise error(:activation, fixed_attrs['profession_code'].empty?), 'Поле "Код направления/специальности" не определено' if attributes['profession_code'].empty?
			raise error(:activation, fixed_attrs['study_type_id'].empty?), 'Поле "Основа обучения" не определено' if attributes['study_type_id'].empty?
		end
	end
end
