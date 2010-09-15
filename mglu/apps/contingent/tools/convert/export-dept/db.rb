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
	
	def workaround(hash)
		h = {}
		@column_names.each { |col|
			h[col] = nil
		}
		hash.each_pair { |key,value|
			h[key] = value
		} if hash.kind_of? Hash
		h
	end

	def fetch_hash with_table = false
		if block_given? then
			@result.each_hash with_table do |row|
				yield workaround(row)
			end
		else
			workaround(@result.fetch_hash(with_table))
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
	def initialize server = nil, user = nil, passwd = nil, db = nil
		@conn = Mysql.new server, user, passwd, db
		$db_encoding = @conn.character_set_name.gsub('_', '-').gsub('-ru', '-r')
	end

	def execute query
		result = MySQL_result.new @conn.query(query)

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
end

$sql = MySQL.new 'localhost', 'contingent', 'faretheewell', 'contingent'
