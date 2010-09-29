require 'data/order/studentsorder'
require 'expression'

class MagisterEnrollmentOrder < StudentsOrder
	TYPE = 'О зачислении в МГЛУ на образовательные программы подготовки магистров'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( study_type_id degree_code specialization_code profession_code ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"degree_code"=>62, "student_state"=>"studying"}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'study_type_id' => attributes['study_type_id']
		}.compact

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'degree_code' => '68',
				'specialization_code' => attributes['specialization_code'],
				'profession_code' => attributes['profession_code']
			}.compact, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForMagisterEnrollmentOrder.has_order?
			fixed_attrs = DetailsForMagisterEnrollmentOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

			raise error(:activation, fixed_attrs['study_type_id'].empty?), 'Поле "Основа обучения" не определено' if attributes['study_type_id'].empty?
		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForMagisterEnrollmentOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['specialization_code'].empty?), 'Поле "Код специализации" не определено' if attributes['specialization_code'].empty?
			raise error(:activation, fixed_attrs['profession_code'].empty?), 'Поле "Направление подготовки/специальность, специализация, ступень образования" не определено' if attributes['profession_code'].empty?
		end
	end
end
