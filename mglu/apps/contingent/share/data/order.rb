require 'data/group'
require 'data/student'
require 'data/classifier'
require 'data/user'

class Order
	##
	# Basic exception
	class Error < RuntimeError
		attr_reader :order, :fatal

		def initialize order, fatal = true
			@order, @fatal = order, fatal
		end
	end

	##
	# Activation exception
	class ActivationError < Error
		attr_accessor :student_ids, :group_ids

		def initialize order, fatal = true, params = {}
			super order, fatal

			@student_ids = params['student_ids'] unless params['student_ids'].empty?
			@group_ids   = params['group_ids']   unless params['group_ids'].empty?
		end
	end

	##
	# Тип объектов, по которым создается приказ - один из:
	# 	TARGET = :virtual
	# 	TARGET = :applicant
	# 	TARGET = :student
	# 	TARGET = :group
	# 	TARGET = :course
	# 	TARGET = :order
	TARGET = nil

	CLASS_NAME = %w(
		TransitionOrder

		ExpelationOrder

		BeginVacationOrder
		EndVacationOrder

		RestorationOrder

		LiabilitiesProlongationOrder
		LiabilitiesRemovalOrder

		RenamingOrder

		EnrollmentOrder
		EnrollmentTransitionOrder

		ProgramSwitchingOrder

		StudyTypeSwitchingOrder

		KeepDownOrder

		CancellationOrder

		CitizenshipSwitchingOrder

		GraduationOrder

		DormitoryOccupancyOrder

		MagisterEnrollmentOrder

		DiplomaProlongationOrder

		ScholarshipAssignmentOrder
		IndividualScholarshipAssignmentOrder

		BeginTraineeOrder

		AdjustVacationOrder

		FirstYearScholarshipAssignmentOrder

		EverythingModificationOrder

		GroupCreationOrder

		BachelorGraduationOrder
	)

	##
	# Order type ID
	def self.type_id class_name = self
		CLASS_NAME.index class_name.to_s
	end

	##
	# Long descriptive name of an order, stored in Ruby class
	def self.type_name type_id = type_id
		const_get(CLASS_NAME[type_id])::TYPE if CLASS_NAME[type_id]
	end

	def self.file_name
		self.name.downcase
	end

	STATISTICS = {
		'Статус' => 'order_status',
	}

	def self.list params, fields = []
		unless ( where_clauses = convert_search_params(params).compact ).empty? then
			order_ids = []; $sql.execute("SELECT DISTINCT o.*, f.*
			                              FROM faculty f RIGHT JOIN `order` o USING (faculty_id) LEFT JOIN order_student os USING (order_id) LEFT JOIN student s USING (student_id) LEFT JOIN user cr ON o.creator_id = cr.user_id
			                              WHERE #{where_clauses.join ' AND '}
			                              ORDER BY date_activated DESC, number DESC, date_created DESC, o.order_id DESC").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				order_ids << row['order_id'].to_i
			end; ( result = {} )[:total] = order_ids.size

			unless order_ids.empty? then
				for title, category in STATISTICS do
					stat = {}; $sql.execute("SELECT c.name, COUNT(*) AS value
					                         FROM #{category} c INNER JOIN `order` USING (#{category}_id)
					                         WHERE order_id IN (#{order_ids.join ', '})
					                         GROUP BY c.name").fetch do |row|
						stat[row['name']] = row['value'].to_i
					end; result[title] = stat
				end
			end

			return result
		end
	end

	def self.from_xml xml
		o = super

		o.instance_variable_set '@attributes', {}

		for var in o.instance_variables do
			o.attributes[var.gsub(/^@/, '')] = o.instance_variable_get var unless o.respond_to? var.gsub(/^@/, '')
		end

		return o
	end

	AFFECTED_ATTRIBUTES = {}

	private_class_method :new

	def self.create type_id, faculty_id = nil, creator_id = nil
		if CLASS_NAME[type_id] then
			unless const_get(CLASS_NAME[type_id])::NEEDS_FACULTY and faculty_id.nil? then
				$sql.execute "INSERT INTO `order` (order_type_id, order_status_id, date_created, faculty_id, creator_id)
				              VALUES (#{type_id}, #{Classifier::OrderStatus::PROJECT}, CURDATE(), #{faculty_id.quote}, #{creator_id.quote})"

				load $sql.insert_id
			else
				raise Error.new(self), 'в приказе требуется указание факультета'
			end
		else
			raise Error.new(self), "неизвестный тип приказа (ID:#{type_id})"
		end
	end

	def self.load oid, tables = nil
		if params = $sql.execute("SELECT *
		                          FROM `order`
		                          WHERE order_id = #{oid}").fetch then
			const_get(CLASS_NAME[params['order_type_id'].to_i]).new oid, params
		else
			raise Error.new(self), "приказ (ID:#{oid}) не найден"
		end
	end

	def self.fix
		list({ 'order_type_id' => type_id }, %w( order_id )) do |order_id|
			if ( o = load order_id ).editable? then
				o.fix
			end
		end
	end

	def self.delete oid
		load(oid).delete
	end

	##
	# ID приказа в БД
	attr_reader :oid

	##
	# Статус приказа - константа, одна из определенных в Classifier::OrderStatus
	attr_reader :status

	##
	# Номер приказа
	attr_accessor :number

	##
	# Дата создания проекта приказа
	attr_reader :date_created

	##
	# Дата введения в действие (активации) приказа
	attr_reader :date_activated

	##
	# XML-атрибуты приказа (Hash)
	attr_reader :attributes

	##
	# ID факультета, издавшего приказ
	attr_reader :faculty_id

	##
	# ID пользователя, создавшего приказ
	attr_reader :creator_id

	attr_accessor :auto_fix

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@faculty_id     = params['faculty_id'].to_i unless params['faculty_id'].empty?
			@creator_id     = params['creator_id'].to_i unless params['creator_id'].empty?

			@status         = params['order_status_id'].to_i
			@number         = params['number']

			@date_created   = params['date_created'].to_d
			@date_activated = params['date_activated'].to_d

			@attributes     = params['attributes'].to_h
			@html           = params['html'] unless params['html'].empty?
		end
	end

	def title
		self.class.type_name
	end

	def faculty
		@faculty ||= Faculty.load @faculty_id if @faculty_id
	end

	def creator
		@creator ||= User.load @creator_id if @creator_id
	end

	def editable?
		@status == Classifier::OrderStatus::PROJECT
	end

	def full?
		true
	end

	def to_s
		number
	end

	def to_html
		if self.status < Classifier::OrderStatus::ACTIVATING then
			"&#x2116;&nbsp;#{self.oid}"
		else
			Document.new(self.date_activated, self.number).to_html
		end
	end

	def to_hash resolve_ids = false
		hash = super

		if resolve_ids then
			hash['type'] = self.class.type_name
			hash |= hash.delete('attributes').resolve_ids
		else
			hash['type_id'] = self.class.type_id
			hash |= hash.delete 'attributes'
		end

		each_student :all, %w( student_id paragraph_id ) do |student_id, paragraph_id|
			if resolve_ids then
				attributes = get_student_attributes(student_id).resolve_ids

				attributes['paragraph'] = self.class::PARAGRAPH_NAME[paragraph_id]
				attributes['student']   = Student.load student_id
			else
				attributes = get_student_attributes student_id

				attributes['paragraph_id'] = paragraph_id
				attributes['student_id']   = student_id
			end

			( hash['students'] ||= [] ) << attributes
		end

		each_group %w( group_id ) do |group_id|
			attributes = get_group_attributes group_id

			if resolve_ids then
				attributes['group'] = Group.load group_id
			else
				attributes['group_id'] = group_id
			end

			( hash['groups'] ||= [] ) << attributes
		end if respond_to? :each_group

		return hash
	end

	alias_method :to_h, :to_hash

	def save
		try_to_modify

		$sql.execute "UPDATE `order`
		              SET number     = #{@number.quote}
		                , attributes = #{@attributes.quote}
		              WHERE order_id = #{@oid}"
	end

	##
	# It's assumed that _all_ the students are in some paragraph now or _all_ of them are "free".
	def move student_ids, paragraph_id
		try_to_modify

		if self.class::PARAGRAPH_NAME[paragraph_id] or paragraph_id.nil? then
			if $sql.execute("SELECT *
			                 FROM order_student
			                 WHERE order_id = #{@oid} AND student_id IN (#{student_ids.join ', '})").num_rows == 0 then
				for student_id in student_ids do
					$sql.execute "INSERT INTO order_student (order_id, student_id, paragraph_id, attributes)
					              VALUES (#{@oid}, #{student_id}, #{paragraph_id.quote}, NULL)"
				end
			else
				$sql.execute "UPDATE order_student
				              SET paragraph_id = #{paragraph_id}, attributes = NULL
				              WHERE order_id = #{@oid} AND student_id IN (#{student_ids.join ', '})"
			end
		else
			raise error, "в приказе нет параграфа #{paragraph_id + 1}"
		end
	end

	##
	# Возвращает Student.load(student_id, tables), если данный студент есть в приказе, иначе - nil.
	def get_student student_id, tables = nil
		unless $sql.execute("SELECT *
		                     FROM order_student
		                     WHERE order_id = #{@oid} AND student_id = #{student_id}").num_rows == 0 then
			Student.load student_id, tables
		end
	end

	##
	# Проходит по студентам в приказе, выбираемым в зависимости от
	# paragraph_id
	#
	# * :all - по всем студентам
	# * nil - по студентам, которые должны быть в приказе, но не включены
	# * число - номер параграфа в приказе (нумеруются от 0)
	#
	# fields - массив строк, задающий те поля, которые будут выданы
	# (yield) в заданном порядке
	#
	# Семантика самих полей описана в convert_sql_result
	def each_student paragraph_id = :all, fields = %w( student_id last_name first_name father_name card_number group_id group )
		student_ids = []; $sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
		                                FROM order_student INNER JOIN student s USING (student_id) LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id) LEFT JOIN faculty f USING (faculty_id)
		                                WHERE order_id = #{@oid}#{" AND paragraph_id = #{paragraph_id.to_i}" unless paragraph_id == :all}
		                                ORDER BY f.short_name, d.department_num, current_term_number, g.group_num#{", paragraph_id" if paragraph_id == :all}, last_name, first_name, father_name").fetch do |row| # BlackFix: paragraph_id.to_i conversion is not good.
			yield *( convert_sql_result row, fields ) if block_given?

			student_ids << row['student_id'].to_i
		end

		return Student.list_statistics(student_ids)
	end

	##
	# "Откатывает" изменения атрибутов студента с ID=student_id, внесенные данным приказом.
	def rollback_student student_id
		( s = Student.load student_id ).recondition @date_activated

		old_status, @status = @status, Classifier::OrderStatus::ACTIVATING # BlackFix

		set :student, { # CAUTION: do not forget to update the set!
			'last_name'         => s.last_name,
			'first_name'        => s.first_name,
			'father_name'       => s.father_name,

			'gender_id'         => s.gender_id,
			'birth_date'        => s.birth_date,
			'citizenship_id'    => s.citizenship_id,
			'scholarship_id'    => s.scholarship_id,

			'card_number'       => s.card_number,
			'group_id'          => s.group_id,

			'student_status_id' => s.status_id,
			'study_type_id'     => s.study_type_id,
			'category'          => s.category,
			'dormitory'         => s.dormitory,

			'student_state_id'  => s.state_id,
			'military_id'       => s.military_state_id,

			'profession_code'   => s.profession_code,
			'degree_code'       => s.degree_code,

			'liabilities'       => s.liabilities,
		} & self.class::AFFECTED_ATTRIBUTES[:student], [ s.oid ]

		@status = old_status # BlackFix
	end

	def html
		if @html.empty? then
			(tmpl = Radical::Templating::TemplateManager["order/print_versions/#{self.class.file_name}", File.expand_path("apps/contingent/tmpl")]).order = self # BlackFix
			tmpl.set_header_attr(self) if tmpl.respond_to?(:set_header_attr) # avfix
			tmpl.set_footer_attr(self) if tmpl.respond_to?(:set_footer_attr)
			tmpl.render
		else
			@html
		end
	end

	def html_part(part, user_id)
		@html.gsub! /<h2>&#167; (\d+)<\/h2>/, '<h3>&#167; \\1</h3>' if @html # dirty hack for misspelled CancelationOrder print version
		parts = html.split(/<h3>&#167;/)
		footer_parts = parts[-1].split(/<table class="signatures">/)
		parts[-1] = footer_parts[0]
		footer = '<table class="signatures">' + footer_parts[1]
		parts[0].gsub!(/<h1>ПРИКАЗ<\/h1>/, '<h1>ВЫПИСКА ИЗ ПРИКАЗА</h1>')
		if part == :all
			res = ''
			each_student[:total].times { |i|
				res += parts[0] + '<h3>&#167;' + parts[i+1] + footer
			}
		else
			res = parts[0] + '<h3>&#167;' + parts[part] + footer
		end
		res.gsub!(/^<\/body>$/, "<p>Верно: ____________ " + User.load(user_id).name + " </p>\n</body>\n")
		res.gsub!(/<\/body>(.*?)<body>/m, '<br style="page-break-after:always;" />')
		return res
	end

	def check
		try_to_activate
	end

	def freeze
		try_to_modify; try_to_activate

		$sql.execute "UPDATE `order`
		              SET order_status_id = #{@status = Classifier::OrderStatus::FROZEN}
		              WHERE order_id = #{@oid}"
	end

	def thaw
		$sql.execute "UPDATE `order`
		              SET order_status_id = #{@status = Classifier::OrderStatus::PROJECT}
		              WHERE order_id = #{@oid}" if @status == Classifier::OrderStatus::FROZEN
	end

	def activate date = Date.today, number = @number
		@date_activated, @number = date, number

		thaw; try_to_activate; save

		begin
			_activate
		rescue Exception => e
			begin
				_rollback
			rescue Exception => e
				raise error(:activation), "неустранимая ошибка (#{e.message})\nОБЯЗАТЕЛЬНО сохраните это сообщение и обратитесь к разработчикам!"
			else
				raise error(:activation), "неизвестная ошибка (#{e.message})"
			end
		else
			commit_activation
		end
	end

	def error type = nil, fatal = true, params = {}
		case type
		when :activation then
			ActivationError.new self, fatal, params
		else
			Error.new self, fatal
		end
	end

	private

	def remove entity, entity_ids = :all
		try_to_modify

		$sql.execute "DELETE FROM order_#{entity}
		              WHERE order_id = #{@oid}#{" AND #{entity}_id IN (#{entity_ids.join ', '})" unless entity_ids == :all}"
	end

	def set entity, set_clauses, filter = :all
		try_to_modify

		set_clauses = set_clauses.collect do |key, value|
			"#{key} = #{value.quote}"
		end if set_clauses.is_a? Hash

		$sql.execute "UPDATE `#{entity}` INNER JOIN order_#{entity} USING (#{entity}_id)
		              SET #{set_clauses.join ', '}
		              WHERE order_id = #{@oid}#{case filter
		              when :all then
		              when String then
		              	" AND (#{filter})"
		              when Array then
		              	" AND #{entity}.#{entity}_id IN (#{filter.join ', '})"
		              end}"
	end

	def get_attributes entity, entity_id
		if result = $sql.execute("SELECT attributes
		                          FROM order_#{entity}
		                          WHERE order_id = #{@oid} AND #{entity}_id = #{entity_id}").fetch then
			result['attributes'].to_h
		else
			{}
		end
	end

	def set_attributes entity, entity_id, attributes
		try_to_modify

		if $sql.execute("SELECT *
		                 FROM order_#{entity}
		                 WHERE order_id = #{@oid} AND #{entity}_id = #{entity_id}").num_rows == 0 then
			$sql.execute "INSERT INTO order_#{entity} (order_id, #{entity}_id, attributes)
			              VALUES (#{@oid}, #{entity_id}, #{attributes.quote})"
		else
			$sql.execute "UPDATE order_#{entity}
			              SET attributes = #{attributes.quote}
			              WHERE order_id = #{@oid} AND #{entity}_id = #{entity_id}"
		end
	end

	def delete
		$sql.execute "DELETE FROM `order` WHERE order_id = #{@oid}"
	end

	def _activate
		$sql.execute "UPDATE `order`
		              SET order_status_id = #{@status = Classifier::OrderStatus::ACTIVATING}
		                , date_activated  = #{@date_activated.quote}
		                , html            = #{html.quote}
		              WHERE order_id = #{@oid}"
	end

	def _rollback
		each_student :all, %w( student_id ) do |student_id|
			rollback_student student_id
		end if respond_to? :rollback_student

		case @status
		when Classifier::OrderStatus::ACTIVATING then
			$sql.execute "UPDATE `order`
			              SET order_status_id = #{@status = Classifier::OrderStatus::PROJECT}
			                , date_activated  = #{(@date_activated = nil).quote}
			                , html            = #{(@html = nil).quote}
			              WHERE order_id = #{@oid}"
		end
	end

	def commit_activation
		$sql.execute "UPDATE `order`
		              SET order_status_id = #{@status = Classifier::OrderStatus::ACTIVATED}
		              WHERE order_id = #{@oid}"
	end

	def try_to_modify
		raise error, 'приказ доступен только для чтения' unless @status.in? [ Classifier::OrderStatus::PROJECT, Classifier::OrderStatus::ACTIVATING ]
	end

	def try_to_activate
		raise error, 'приказ находится в стадии ввода в действие' if @status == Classifier::OrderStatus::ACTIVATING
		raise error, 'приказ уже был введен в действие' if @status > Classifier::OrderStatus::ACTIVATING
	end
end

for class_name in Order::CLASS_NAME do
	require "data/order/#{class_name.to_s.downcase}"
end unless Object.const_defined? :Generator
