require 'mysql'

class MySQL_result
	attr_reader :column_names

	def initialize res
		if @result = res then
			@column_names = res.fetch_fields.collect do |field|
				field.name
			end
		end
	end

	def fetch_hash with_table = false
		if block_given? then
			@result.each_hash with_table do |row|
				yield row
			end
		else
			@result.fetch_hash with_table
		end
	end

	def fetch_array
		if block_given? then
			@result.each do |row|
				yield row
			end
		else
			@result.fetch_row
		end
	end

	alias_method :fetch, :fetch_hash

	def num_rows
		@result.num_rows
	end
end

class MySQL
	HOST = 'localhost'
	USER = 'mglu'
	PASSWORD = 'wurahd6E'
	DATABASE = 'mglu'

	def initialize
		reconnect
	end
	
	def reconnect
		@conn = Mysql.init
		if Mysql.const_defined? :SET_CHARSET_NAME
			@conn.options( Mysql::SET_CHARSET_NAME, $db_encoding = 'utf8' )
			@conn.connect(HOST, USER, PASSWORD, DATABASE)
		else
			@conn.connect(HOST, USER, PASSWORD, DATABASE)
			$db_encoding = @conn.character_set_name.gsub('_', '-').gsub('-ru', '-r')
		end
	end

	def execute query
		retries = 0
		begin
			reconnect unless @conn
			#$stderr.puts "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] #{query.gsub(/\s+/, ' ')}"
			result = MySQL_result.new @conn.query(query)
		rescue MysqlError => e
			# Server gone away - try to reconnect
			if ((e.errno == 2006) or (e.error == 'query: not connected')) and retries < 5
				retries += 1
				reconnect
				retry
			end
			s = "Error '#{e}' (code=#{e.errno}),  while trying to execute '#{query}'"
			s << "\nSQL state: '#{e.sqlstate}'" if e.respond_to?('sqlstate')
			raise MysqlError.new(s)
		end

		if block_given? then
			yield result
		else
			return result
		end
	end

	def insert_id
		@conn.insert_id
	end

	def quote string
		@conn.quote string
	end

	def columns table
		$sql.execute("SELECT * FROM #{table}") do |query|
			return query.column_names
		end
	end
end

$sql = MySQL.new
