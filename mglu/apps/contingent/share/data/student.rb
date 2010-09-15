require 'data/dataobject'

require 'data/group'
require 'data/order'
require 'data/classifier'

require 'document'
require 'daterange'

class Student < DataObject
	TABLES = %w( common education_basic education_current military )

	EXPORT_METHODS = %w( enrollment quit )

	STATISTICS = {
		'Пол'       => 'gender',
		'Состояние' => 'student_state',
		'Основа'    => 'study_type',
		'Форма'     => 'study_form',
		'Ступень'   => 'degree',
	}

	def self.list params, fields = []
		unless ( where_clauses = convert_search_params(params).compact ).empty? then
			student_ids = []; $sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
			                                FROM student s LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id) LEFT JOIN faculty f USING (faculty_id)
			                                WHERE #{where_clauses.join ' AND '}
			                                ORDER BY last_name, first_name, father_name").fetch(true) do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				student_ids << row['s.student_id'].to_i
			end

			return list_statistics(student_ids)
		end
	end

	def self.list_statistics student_ids
		statistics = { :total => student_ids.size }

		for title, category in STATISTICS do
			stat = {}; $sql.execute("SELECT c.name, COUNT(*) AS value
			                         FROM #{category} c INNER JOIN student USING (#{Classifier[category].primary_key})
			                         WHERE student_id IN (#{student_ids.join ', '})
			                         GROUP BY c.name").fetch do |row|
				stat[row['name']] = row['value'].to_i
			end; statistics[title] = stat
		end unless student_ids.empty?

		return statistics
	end

	def self.from_xml xml
		s = super

		s.instance_variable_set '@last_name',   s.instance_variable_get('@name')['last']
		s.instance_variable_set '@first_name',  s.instance_variable_get('@name')['first']
		s.instance_variable_set '@father_name', s.instance_variable_get('@name')['father']

		s.instance_variable_set '@name', "#{s.last_name} #{s.first_name} #{s.father_name}"

		return s
	end

	##
	# Personal atributes (name, gender, etc.)
	attr_reader :last_name, :first_name, :father_name
	#attr_reader :gender_id, :birth_date, :citizenship_id
	attr_reader :gender_id, :citizenship_id

	# Temp hack for cdimitry's sake
	attr_accessor :birth_date, :dormitory
	attr_accessor :study_form_id

	##
	# Students atributes (IDs, states, group, etc.)
	attr_reader :card_number, :group_id
	attr_reader :status_id, :study_type_id, :category #, :dormitory
	attr_reader :state_id, :military_state_id, :special_enrollment_code
	attr_reader :profession_code, :specialization_code, :degree_code
	attr_reader :liabilities
	attr_reader :scholarship_id

	def initialize oid, params = nil
		super

		if params.is_a? Hash then
			@last_name   = params['last_name']
			@first_name  = params['first_name']
			@father_name = params['father_name']

			@gender_id      = params['gender_id'].to_i unless params['gender_id'].empty?
			@birth_date     = params['birth_date'].to_d
			@citizenship_id = params['citizenship_id'].to_i unless params['citizenship_id'].empty?
			@scholarship_id = params['scholarship_id'].to_i unless params['scholarship_id'].empty?

			@card_number = params['card_number']
			@group_id    = params['group_id'].to_i unless params['group_id'].empty?

			@status_id     = params['student_status_id'].to_i unless params['student_status_id'].empty?
			@study_type_id = params['study_type_id'].to_i unless params['study_type_id'].empty?
			@study_form_id = params['study_form_id'].to_i unless params['study_form_id'].empty?
			@category      = params['category'].to_set
			@dormitory     = params['dormitory'] != '0'

			@state_id                = params['student_state_id'].to_i unless params['student_state_id'].empty?
			@military_state_id       = params['military_id'].to_i unless params['military_id'].empty?
			@special_enrollment_code = params['special_enrollment_code'] unless params['special_enrollment_code'].empty?

			@profession_code     = params['profession_code']
			@specialization_code = params['specialization_code']
			@degree_code         = params['degree_code']

			@liabilities     = params['liabilities'] != '0'

			for table in loaded_tables do
				case table
				when 'common' then # Общие сведения
					@common = {
						# Место рождения
						'birth_place'    => params['birth_place'].to_h,

						# Документы (удостоверене личности, ИНН, карточки страхования и т.п.)
						'documents'      => params['documents'].to_h,

						# Контакты (адреса, телефоны и т.п.)
						'contacts'       => params['contacts'].to_h,
					}

				when 'education_basic' then # Образование
					@education_basic = {
						# Образовательный уровень (ценз)
						'level_id'       => (params['level_id'].empty? ? nil : params['level_id'].to_i),

						# Организация
						'organization'   => params['organization'].to_h,

						# Образовательный документ
						'document'       => params['document'].to_h,

						# Направление подготовки, профессия, специальность, квалификация
						'specialization' => params['specialization'].to_h,

						# Категория абитуриента
						'abiturient_category_id'    => (params['abiturient_category_id'].empty? ? nil: params['abiturient_category_id'].to_i),

						# Медаль (или красный диплом техникума)
						'abiturient_medal_id'       => (params['abiturient_medal_id'].empty?    ? nil: params['abiturient_medal_id'].to_i),

						# Школа (поток? или как это назвать?), из которой поступил абитуриент
						# (1180 и др.)
						'abiturient_school_id'       => (params['abiturient_school_id'].empty?  ? nil: params['abiturient_school_id'].to_i),

						# Оценки из аттестата
						'cert_marks'     => params['cert_marks'].to_h,

						# Оценки вступительных экзаменов
						'exam_marks'     => params['exam_marks'].to_h,
					}

				when 'education_current' then # Условия обучения
					@education_current = {
						# Вид программы
						'program_kind_id'=> (params['program_kind_id'].empty? ? nil : params['program_kind_id'].to_i),

						# Специализация
						'specialization' => params['specialization'],

						# Послевузовское образование
						'post_university'=> params['post_university'].to_h,

						# Приказ об отчислении (какой еще приказ и что он тут делает?)
						'expelation'     => params['expelation'].to_h
					}

				when 'military' then # Воинский учет
					@military = {
						# Категория запаса
						'reserve_category' => params['reserve_category'],

						# Звание
						'rank'             => params['rank'],

						# Соства (профиль)
						'profile'          => params['profile'],

						# ВУС
						'speciality'       => params['speciality'],

						# Категория годности к военной службе
						'fitness'          => params['fitness'].to_h,

						# Воинский учет
						'registration'     => params['registration'].to_h,

						# Военное обучение
						'education'        => params['education'].to_h
					}
				end
			end
		end
	end

	##
	# Возвращает полное имя студента
	def name
		@name ||= "#{@last_name} #{@first_name} #{@father_name}".strip
	end

	##
	# Пол (String)
	def gender
		@gender ||= Classifier::Gender[@gender_id][:name]
	end

	##
	# Место рождения (String)
	def birth_place
		unless [ @old_birth_country_id, @old_birth_region_id ] == [ @common['birth_place']['country_id'], @common['birth_place']['region_id'] ] then
			@birth_place = unless @old_birth_region_id = @common['birth_place']['region_id'] then
				"#{Classifier::Region[@old_birth_region_id][:name]}, #{Classifier::Country[@old_birth_country_id = @common['birth_place']['country_id']][:name]}"
			else
				Classifier::Country[@old_birth_country_id = @common['birth_place']['country_id']][:name]
			end
		else
			@birth_place
		end
	end

	##
	# Гражданство (String)
	def citizenship
		@citizenship ||= Classifier::Citizenship[@citizenship_id][:name]
	end

	##
	# Возвращает true, если студент обучается в Университете, иначе - false
	def studying?
		@state_id.in? [ Classifier::StudentState::STUDYING, Classifier::StudentState::VACATION ]
	end

	##
	# Возвращает объект Group, соответствующий студенту
	def group
		@group ||= if @group_id then Group.load @group_id else Group.new nil end
	end

	##
	# Возвращает объект Department, соответствующий студенту
	def department
		if @group_id then group.department else Department.new nil end
	end

	##
	# Возвращает объект Faculty, соответствующий студенту
	def faculty
		if @group_id then group.faculty else Faculty.new nil end
	end

	##
	# Номер курса
	def course
		if @group_id then group.course else nil end
	end

	##
	# Статус (String)
	def status
		@status ||= Classifier::StudentStatus[@status_id][:name]
	end

	##
	# Основа обучения (String)
	def study_type
		@study_type ||= Classifier::StudyType[@study_type_id][:name]
	end
	
	def study_form
		@study_form ||= Classifier::StudyForm[@study_form_id][:name]
	end

	##
	# Состояние (String)
	def state
		@state ||= Classifier::StudentState[@state_id][:name]
	end

	##
	# Состояние военного обучения (String)
	def military_state
		@military ||= Classifier::Military[@military_state_id][:name]
	end

	##
	# Специальность / Направление подготовки (String)
	def profession
		@profession ||= Classifier::Profession[@profession_code][:name]
	end

	##
	# Ступень высшего профессионального образования (String)
	def degree
		@degree ||= Classifier::Degree[@degree_code][:name]
	end

	##
	# Стипендия, которую получает студент (String)
	def scholarship
		@scholarship ||= Classifier::Scholarship[@scholarship_id][:name]
	end

	##
	# Информация о зачислении (Hash)
	def enrollment
		if ( @enrollment ||= {} ).empty? then
			$sql.execute("SELECT *
			              FROM order_student os INNER JOIN `order` o USING (order_id)
			              WHERE student_id = #{@oid} AND order_status_id = #{Classifier::OrderStatus::ACTIVATED} AND order_type_id IN (#{Order.type_id EnrollmentOrder}, #{Order.type_id EnrollmentTransitionOrder}, #{Order.type_id RestorationOrder}, #{Order.type_id KeepDownOrder}, #{Order.type_id EverythingModificationOrder})
			              ORDER BY date_activated").fetch(true) do |row|
				s_attributes, o_attributes = row['os.attributes'].to_h, row['o.attributes'].to_h

				case row['o.order_type_id'].to_i
				when Order.type_id(EnrollmentOrder) then
					@enrollment['date'] = o_attributes['enrollment_date'].to_d || Date.new(row['o.date_activated'].to_d.year, 9, 1)
				when Order.type_id(EnrollmentTransitionOrder) then
					@enrollment['date'] = o_attributes['enrollment_date'].to_d
				end

				@enrollment['degree'] = o_attributes['degree'] unless o_attributes['degree'].empty?

				@enrollment['agreement'] = s_attributes['agreement_num'].empty? ? s_attributes['agreement'] : {
					'number' => s_attributes['agreement_num'],
					'date'   => s_attributes['agreement_date'].to_d,
				}

				@enrollment['order'] = Document.new row['o.date_activated'].to_d, row['o.number']
			end

			# Cool hack to provide some information for those students who don't have any enrollment order associated with them.
			if @enrollment.empty? then
				@enrollment['date'] = if @card_number =~ /^(\d+)(\D)(\d+)$/ then
					Date.new $1.to_i.year, 9, 1
				else
					Date.new Date.today.year - (group.term_number / 2), 9, 1
				end

				@enrollment['degree'] = 'дипломированный специалист'
			end
		end

		return @enrollment
	end

	##
	# Информация об отчислении/окончании (Order)
	def quit_order
		unless @quit_order then
			$sql.execute("SELECT *
			              FROM order_student os INNER JOIN `order` o USING (order_id)
			              WHERE student_id = #{@oid} AND order_status_id = #{Classifier::OrderStatus::ACTIVATED} AND order_type_id IN (#{ExpelationOrder.type_id}, #{GraduationOrder.type_id})
			              ORDER BY date_activated").fetch(true) do |row|
				@quit_order = Order.load row['os.order_id'].to_i

				for key, value in row['os.attributes'].to_h do
					@quit_order.attributes[key] = value
				end
			end
		end

		return @quit_order
	end

	##
	# Приводит все "неизменяемые" атрибуты студента в соответствие с его историей обучения по состоянию на определенный момент времени, зависящий от condition:
	#
	# * :all - обрабатываются все приказы
	# * :now - состояние на текущий момент
	# * дата (Date) - состояние на начало дня, указанного в condition
	# * строка (String) - состояние перед вводом в действие приказа, номер которого указан в condition
	#
	# TODO: what to do with gender & birth date?
	def recondition condition = :now
		range = case condition
		when :all then
		when :now then
			"date_activated <= #{Date.today.quote}"
		when Date then
			"date_activated < #{condition.quote}"
		when String then
			"number         < #{condition.quote}"
		end

		# Получаем список отмененных приказов для того, чтобы не обрабатывать их в дальнейшем
		cancelled_order_ids = []; $sql.execute("SELECT *
		                                        FROM order_student os INNER JOIN `order` o USING (order_id)
		                                        WHERE student_id = #{@oid} AND order_status_id = #{Classifier::OrderStatus::ACTIVATED} AND order_type_id = #{Order.type_id CancellationOrder}#{" AND #{range}" if range}").fetch(true) do |row|
			cancelled_order_ids << row['o.attributes'].to_h['order_id']
		end

		where_clauses = [
			"student_id      = #{@oid}",
			"order_status_id = #{Classifier::OrderStatus::ACTIVATED}",
		] << range << unless cancelled_order_ids.empty? then
			"o.order_id NOT IN (#{cancelled_order_ids.join ', '})"
		end

		$sql.execute("SELECT *
		              FROM order_student os INNER JOIN `order` o USING (order_id)
		              WHERE #{where_clauses.compact.join ' AND '}
		              ORDER BY date_activated, number").fetch(true) do |row|
			s_attributes, o_attributes = row['os.attributes'].to_h, row['o.attributes'].to_h

			case type_id = row['o.order_type_id'].to_i # CAUTION: do not forget to update the routine!
			when EnrollmentOrder.type_id, EnrollmentTransitionOrder.type_id then
				@last_name     = s_attributes['name']['last'] if s_attributes['name']['last']
				@first_name    = s_attributes['name']['first'] if s_attributes['name']['first']
				@father_name   = s_attributes['name']['father'] if s_attributes['name']['father']

				@card_number   = s_attributes['card_number'] if s_attributes['card_number']
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']

				@state_id      = Classifier::StudentState::STUDYING
				@study_type_id = o_attributes['study_type_id'] if o_attributes['study_type_id']
				@profession_code = s_attributes['profession_code'] if s_attributes['profession_code']

				@liabilities   = (not s_attributes['liabilities'].empty?)
			when TransitionOrder.type_id then
				g_attributes = $sql.execute("SELECT *
				                             FROM order_group
				                             WHERE order_id = #{row['os.order_id']} AND group_id = #{@group_id}").fetch['attributes'].to_h

				@group_id      = g_attributes['next_id'] if g_attributes['next_id']

				@scholarship_id = s_attributes['scholarship_id'] if s_attributes['scholarship_id']

				@liabilities   = row['os.paragraph_id'].to_i == 1
			when BeginVacationOrder.type_id then
				@state_id      = Classifier::StudentState::VACATION
			when EndVacationOrder.type_id then
				@card_number   = s_attributes['card_number'] if s_attributes['card_number']
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']

				@state_id      = Classifier::StudentState::STUDYING

				@liabilities   = (not s_attributes['liabilities'].empty?)
			when RenamingOrder.type_id then
				@last_name     = s_attributes['name']['last'] if s_attributes['name']['last']
				@first_name    = s_attributes['name']['first'] if s_attributes['name']['first']
				@father_name   = s_attributes['name']['father'] if s_attributes['name']['father']
			when ProgramSwitchingOrder.type_id then
				@card_number   = s_attributes['card_number'] if s_attributes['card_number']
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']
				@profession_code = s_attributes['profession_code'] if s_attributes['profession_code']

				@liabilities   = (not s_attributes['liabilities'].empty?)
			when StudyTypeSwitchingOrder.type_id then
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']

				@study_type_id = Classifier::StudyType::BUDGET
			when KeepDownOrder.type_id then
				@card_number   = s_attributes['card_number'] if s_attributes['card_number']
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']

				@study_type_id = Classifier::StudyType::CONTRACT
				@profession_code = s_attributes['profession_code'] if s_attributes['profession_code']

				@liabilities   = (not s_attributes['liabilities'].empty?)
			when ExpelationOrder.type_id then
				@state_id      = Classifier::StudentState::EXPELLED
			when RestorationOrder.type_id then
				@card_number   = s_attributes['card_number'] if s_attributes['card_number']
				@group_id      = s_attributes['group_id'] if s_attributes['group_id']

				@state_id      = Classifier::StudentState::STUDYING
				@study_type_id = o_attributes['study_type_id'] if s_attributes['study_type_id']
				@profession_code = s_attributes['profession_code'] if s_attributes['profession_code']

				@liabilities   = (not s_attributes['liabilities'].empty?)
			when LiabilitiesRemovalOrder.type_id then
				@liabilities   = false
			when RestorationOrder.type_id then
				@profession_code = s_attributes['profession_code'] if s_attributes['profession_code']
			when ScholarshipAssignmentOrder.type_id, IndividualScholarshipAssignmentOrder.type_id, FirstYearScholarshipAssignmentOrder.type_id then
				@scholarship_id = s_attributes['scholarship_id'] if s_attributes['scholarship_id']
			end

			@name      = "#{@last_name} #{@first_name} #{@father_name}"

			@status_id = Classifier::StudentStatus::STUDENT

			# clear cache
			@group, @status, @state, @study_type, @citizenship, @scholarship = [nil]*6

			group.recondition condition if group_id
		end

		return self
	end

	def to_s
		name
	end

	def to_hash resolve_ids = false
		hash = super

		hash['name'] = {
			'last'   => hash.delete('last_name'),
			'first'  => hash.delete('first_name'),
			'father' => hash.delete('father_name'),
		}

		for table in loaded_tables do
			hash |= if resolve_ids then hash.delete(table).resolve_ids else hash.delete table end
		end

		return hash
	end

	alias_method :to_h, :to_hash
end
