require 'extensions'

module Classifier
	def self.[] name
		const_name = case name.to_s
		when /^[a-z_]+$/ then
			name.to_s.split('_').collect do |word|
				word.capitalize
			end.join
		when /^([A-Z][a-z]+)+$/ then
			name
		end

		Classifier.const_get const_name if const_name and Classifier.const_defined? const_name
	end

	private

	class Cache
		@@entries = {}

		def self.[]= classifier, entries
			@@entries[classifier] = entries
		end

		def self.[] classifier
			classifier.load unless @@entries.include? classifier

			@@entries[classifier]
		end

		def self.clear classifier = nil
			if classifier then
				@@entries.delete classifier
			else
				@@entries.clear
			end
		end
	end

	class Basic
		def self.primary_key
			"#{table_name}_#{key_postfix}"
		end

		private

		def self.table_name
			self.name.gsub(/^(.+::)+/, '').gsub(/(.)([A-Z])/, '\1_\2').downcase
		end

		def self.[] id
			self.new[id]
		end

		public

		attr_reader :name

		def initialize name = self.class.table_name
			@name = name

			@entries = Cache[self.class]
		end

		def each &block
			@entries.each &block
		end

		def [] id
			id = { :id => id } unless id.is_a? Hash

			for entry in @entries do
				return entry unless (entry & id).empty? # "or" criteria matching
			end; return nil
		end

		def select id
			@selected_id = id
		end

		def selected
			self[@selected_id]
		end
	end

	CLASSIFIERS = {
		:Simple => %w(
			IdentityDocumentType
			InitialEducationDocumentType FinalEducationDocumentType ProgramKind
			Role Scholarship
			AbiturientCategory AbiturientSchool AbiturientMedal
		),
		:Coded => {
			:Gender => { :NAME => 'ОКИН' },

			:Country     => { :NAME => 'ОКСМ'  },
			:Region      => { :NAME => 'ОКАТО' },
			:Citizenship => { :NAME => 'ОКИН'  },

			:EducationLevel              => { :NAME => 'ОКИН' },
			:EducationalOrganizationType => { :NAME => 'ОКИН' },
			:EducationalOrganizationKind => { :NAME => 'ОКИН' },
			:StudyForm                   => { :NAME => 'ОКИН' },
		},
		:CodedID => {
			:Profession => { :NAME => 'ОКСО' },
			:Degree     => { :NAME => 'ОКСО' },
		},
		:Hierarchic => {}
	}

	public

	for type, classifiers in CLASSIFIERS do
		require "data/classifier/#{type.to_s.downcase}"

		case classifiers
		when Array then
			for classifier in classifiers do
				const_set(classifier, Class.new(const_get(type)))
			end
		when Hash then
			for classifier, constants in classifiers do
				const_set(classifier, Class.new(const_get(type)))

				for key, value in constants do
					const_get(classifier).const_set(key, value)
				end
			end
		end
	end

	# TODO: remove this
	class Faculty < Coded
		def self.load
			entries = []; $sql.execute('SELECT * FROM faculty ORDER BY name').fetch do |row|
				entries << {
					:id     => row['faculty_id'].to_i,
					:name   => row['name'],
					:code   => row['short_name'],
					:letter => row['letter'],
				}
			end; Cache[self] = entries
		end
	end

	class StudyType < Simple
		BUDGET   = 1
		CONTRACT = 2
	end
	
	class StudyForm < Coded
		FULLTIME   = 1
		MIXED      = 2
		POSTAL     = 3
		SELF       = 4
		EXTERNSHIP = 5
	end

	class StudentStatus < Simple
		STUDENT = 1

		def self.load
			Cache[self] = [
				{
					:id   => STUDENT,
					:name => 'студент',
				},
			]
		end
	end

	class StudentState < Simple
		STUDYING  = 2
		VACATION  = 3
		EXPELLED  = 4
		GRADUATED = 6
		TRAINEE   = 7

		def self.load
			Cache[self] = [
				{
					:id   => STUDYING,
					:name => 'обучается',
				},
				{
					:id   => VACATION,
					:name => 'в академ. отпуске',
				},
				{
					:id   => EXPELLED,
					:name => 'отчислен',
				},
				{
					:id   => GRADUATED,
					:name => 'окончил',
				},
				{
					:id   => TRAINEE,
					:name => 'на стажировке',
				},
			]
		end
	end

	class OrderStatus < Simple
		PROJECT    = 1
		FROZEN     = 2
		ACTIVATING = 3
		ACTIVATED  = 4

		def self.load
			Cache[self] = [
				{
					:id   => PROJECT,
					:name => 'проект',
				},
				{
					:id   => FROZEN,
					:name => 'в стадии подписания',
				},
				{
					:id   => ACTIVATED,
					:name => 'введен в действие',
				},
				{
					:id   => ACTIVATING,
					:name => 'содержит ошибки',
				},
			]
		end
	end

	require 'data/order'

	class OrderType < Simple
		def self.load
			Cache[self] = ( Order::CLASS_NAME.collect do |class_name|
				{
					:id   => (type_id = Order.type_id class_name),
					:name => (Order.type_name type_id),
				}
			end )
		end
	end

	class OrderTypeShort < Simple
		private

		def self.table_name
			'order_type'
		end

		public

		def self.load
			short_type_name = [
				'перевод',
				'отчисление',
				'академ. отпуск',
				'допуск к уч. проц.',
				'восстановление',
				'перенос задолж.',
				'ликвидация задолж.',
				'изменение Ф.И.О.',
				'зачисление',
				'зачисл. переводом',
				'изменение прогр.',
				'переход на бюджет.',
				'повторное обучение',
				'отмена приказа',
				'изменение гражд.',
				'завершение',
				'посел. в общежтие',
				'зачисл. в магистр.',
				'перенос диплома',
				'стипендия',
				'инд. стипендия',
				'загранстажировка',
				'понижение курса',
				'стипендия (1 курс)',
				'изменение данных',
				'создание группы',
				'заверш. бакалавров',
			]

			Cache[self] = ( Order::CLASS_NAME.collect do |class_name|
				{
					:id   => (type_id = Order.type_id class_name),
					:name => short_type_name[type_id],
				}
			end )
		end
	end
end
