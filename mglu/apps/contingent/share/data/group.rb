require 'extensions'

require 'data/department'

##
# Группа обучающихся
class Group
	EXPORT_METHODS = %w( monitor )

	def self.load oid, tables = nil
		if params = $sql.execute("SELECT *
		                          FROM `group` g INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
		                          WHERE #{ case oid
		                          	when Integer then
		                          		"group_id = #{oid}"
		                          	else
		                          		convert_search_params( 'group' => "#{oid}" )
		                          	end }").fetch(true) then
			self.new params['g.group_id'].to_i, params
		else
			raise "#{self} ##{oid} not found"
		end
	end

	##
	# ID группы в БД
	attr_reader :oid

	##
	# Полное название группы
	attr_reader :name

	##
	# ID кафедры в БД
	attr_reader :department_id

	##
	# Номер семестра
	attr_reader :term_number

	##
	# Номер курса
	attr_reader :course

	##
	# Номер группы в потоке
	attr_reader :number

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@department_id = params['g.department_id'].to_i
			@term_number   = params['g.current_term_number'].to_i
			@number        = params['g.group_num'].to_i

			@name   = "#{params['f.short_name']}#{params['d.department_num']}-#{@term_number}-#{@number}"
			@course = (@term_number / 2.0).round
		end
	end

	##
	# Возвращает объект Department, соответствующий группе
	def department
		@department ||= if @department_id then Department.load @department_id else Department.new nil end
	end

	##
	# Возвращает объект Faculty, соответствующий группе
	def faculty
		if @department_id then department.faculty else Faculty.new nil end
	end

	##
	# ID старосты в БД
	def monitor_id
		@monitor_id ||= $sql.execute("SELECT *
			              FROM order_group og INNER JOIN `order` o USING (order_id)
			              WHERE group_id = #{@oid} AND order_status_id = #{Classifier::OrderStatus::ACTIVATED} AND order_type_id = #{Order.type_id TransitionOrder}
			              ORDER BY date_activated DESC
			              LIMIT 1").fetch(true)['og.attributes'].to_h['monitor_id']
	end

	def monitor
		@monitor ||= Student.load monitor_id if monitor_id # BlackFix: some legacy support
	end

	##
	# Приводит все атрибуты группы в соответствие с историей приказов по состоянию на определенный момент времени, зависящий от condition:
	#
	# * :all - обрабатываются все приказы
	# * :now - состояние на текущий момент
	# * дата (Date) - состояние на начало дня, указанного в condition
	# * строка (String) - состояние перед вводом в действие приказа, номер которого указан в condition
	#
	# NOTE: на данный момент работает совсем не так, как Student#recondition, и повторному использованию НЕ ПОДЛЕЖИТ!
	def recondition condition = :now
		range = case condition
		when :all then
		when :now then
			"date_activated > #{Date.today.quote}"
		when Date then
			"date_activated >= #{condition.quote}"
		when String then
			"number         >= #{condition.quote}"
		end

		# Получаем список отмененных приказов для того, чтобы не обрабатывать их в дальнейшем
		cancelled_order_ids = []; $sql.execute("SELECT *
		                                        FROM order_group og INNER JOIN `order` o USING (order_id)
		                                        WHERE group_id = #{@oid} AND order_status_id = #{Classifier::OrderStatus::ACTIVATED} AND order_type_id = #{Order.type_id CancellationOrder}#{" AND #{range}" if range}").fetch(true) do |row|
			cancelled_order_ids << row['o.attributes'].to_h['order_id']
		end

		where_clauses = [
			"group_id        = #{@oid}",
			"order_status_id = #{Classifier::OrderStatus::ACTIVATED}",
		] << range << unless cancelled_order_ids.empty? then
			"o.order_id NOT IN (#{cancelled_order_ids.join ', '})"
		end

		$sql.execute("SELECT *
		              FROM order_group og INNER JOIN `order` o USING (order_id)
		              WHERE #{where_clauses.compact.join ' AND '}
		              ORDER BY date_activated, number").fetch(true) do |row|
			g_attributes, o_attributes = row['og.attributes'].to_h, row['o.attributes'].to_h

			case type_id = row['o.order_type_id'].to_i
			when Order.type_id(TransitionOrder) then
				@term_number = @term_number.prev if row['o.date_activated'].to_d.year < 2008 # legacy logic
			end

			@name   = "#{department.name}-#{@term_number}-#{@number}"
			@course = (@term_number / 2.0).round
		end

		return self
	end

	def to_s
		name
	end
end
