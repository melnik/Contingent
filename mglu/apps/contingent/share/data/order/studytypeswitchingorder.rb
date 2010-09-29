require 'data/order/studentsorder'
require 'expression'

class StudyTypeSwitchingOrder < StudentsOrder
	TYPE = 'О переходе с платной основы обучения на бюджетную'
	PARAGRAPH_NAME = [ 'В приказе' ]

	AFFECTED_ATTRIBUTES = {
		:student => %w( study_type_id group_id ),
	}

	public_class_method :new

	QUALIFIED_STUDENTS = {"study_type_id"=>Classifier::StudyType::CONTRACT}

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses = convert_search_params(params).compact

		super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
	end

	private
	def _activate
		super
		set :student, {
			'study_type_id' => Classifier::StudyType::BUDGET
		}.compact

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'group_id' => attributes['group_id']
			}.compact, [ student_id ]
		end
	end

	def try_to_activate
		super

		if DetailsForStudyTypeSwitchingOrder.has_order?
			fixed_attrs = DetailsForStudyTypeSwitchingOrder.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end

		end

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsForStudyTypeSwitchingOrder.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs

			raise error(:activation, fixed_attrs['group_id'].empty?), 'Поле "Числить в группе" не определено' if attributes['group_id'].empty?
		end
	end
end
