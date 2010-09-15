require 'data/dataobject'

require 'data/faculty'
require 'data/classifier'

class Applicant < DataObject
	TABLES = %w(  )

	STATISTICS = {
		'Пол' => 'gender',
	}

	def self.list params, fields = []
		unless ( where_clauses = convert_search_params(params).compact ).empty? then
			applicant_ids = []; $sql.execute("SELECT *
			                                  FROM applicant a LEFT JOIN faculty f USING (faculty_id)
			                                  WHERE #{where_clauses.join ' AND '}
			                                  ORDER BY group_name, last_name, first_name, father_name").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				applicant_ids << row['applicant_id'].to_i
			end

			return list_statistics(applicant_ids)
		end
	end

	def self.list_statistics applicant_ids
		statistics = { :total => applicant_ids.size }

		for title, category in STATISTICS do
			stat = {}; $sql.execute("SELECT c.name, COUNT(*) AS value
			                         FROM #{category} c INNER JOIN applicant USING (#{Classifier[category].primary_key})
			                         WHERE applicant_id IN (#{applicant_ids.join ', '})
			                         GROUP BY c.name").fetch do |row|
				stat[row['name']] = row['value'].to_i
			end; statistics[title] = stat
		end unless applicant_ids.empty?

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

	attr_reader :last_name, :first_name, :father_name
	attr_reader :group_name

	attr_accessor :gender_id, :birth_date, :citizenship_id

	def initialize oid, params = nil
		super

		if params.is_a? Hash then
			@last_name      = params['last_name']
			@first_name     = params['first_name']
			@father_name    = params['father_name']

			@gender_id      = params['gender_id'].to_i unless params['gender_id'].empty?

			@birth_date     = params['birth_date'].to_d

			@citizenship_id = params['citizenship_id'].to_i unless params['citizenship_id'].empty?

			@faculty_id     = params['faculty_id'].to_i unless params['faculty_id'].empty?
			@group_name     = params['group_name']

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
						'category_id'    => (params['category_id'].empty? ? nil: params['category_id'].to_i)
					}
				end
			end
		end
	end

	##
	# Возвращает полное имя абитуриента
	def name
		@name ||= "#{@last_name} #{@first_name} #{@father_name}".strip
	end

	##
	# Возвращает объект Faculty, соответствующий абитуриенту
	def faculty
		@faculty ||= if @faculty_id then Faculty.load @faculty_id else Faculty.new nil end
	end

	##
	# Пол (String)
	def gender
		@gender ||= Classifier::Gender[@gender_id][:name]
	end

	##
	# Гражданство (String)
	def citizenship
		@citizenship ||= Classifier::Citizenship[@citizenship_id][:name]
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
