require 'mysql'

module Radical
	module Session
		class Session

			# TODO: move these options to config file
			SERVER = 'localhost'
			USERNAME = 'mglu'
			PASSWD = 'wurahd6E'
			DB = 'radical'

			def self.initialize
				reconnect
			end
			
			def self.reconnect
				@@conn = Mysql.new(SERVER, USERNAME, PASSWD, DB)
			end
			
			alias_method :_initialize, :initialize
			
			def initialize(sid)
				_initialize(sid)
				retries = 0
				begin
    					@@conn = Mysql.new(SERVER, USERNAME, PASSWD, DB) unless @@conn
					@vars = @@conn.query("SELECT * FROM session WHERE id='#{@sid}'").fetch_hash['value'].to_hash
				rescue MysqlError => e
					# Server gone away - try to reconnect
					if ((e.errno == 2006) or (e.error == 'query: not connected')) and retries < 5
						retries += 1
	    					@@conn = Mysql.new(SERVER, USERNAME, PASSWD, DB)
						retry
					end
					s = "Error '#{e}' (code=#{e.errno}),  while trying to execute '#{query}'"
					s << "\nSQL state: '#{e.sqlstate}'" if e.respond_to?('sqlstate')
					raise MysqlError.new(s)
				end
			end

			def [](key)
				@vars[key]
			end

			def []=(key,value)
				@vars[key] = value
				retries = 0
				begin
    					@@conn = Mysql.new(SERVER, USERNAME, PASSWD, DB) unless @@conn
					@@conn.query("REPLACE session(id,value) VALUES('#{Mysql.quote(@sid)}', '#{Mysql.quote(@vars.to_xml)}')")
				rescue MysqlError => e
					# Server gone away - try to reconnect
					if ((e.errno == 2006) or (e.error == 'query: not connected')) and retries < 5
						retries += 1
	    					@@conn = Mysql.new(SERVER, USERNAME, PASSWD, DB)
						retry
					end
					s = "Error '#{e}' (code=#{e.errno}),  while trying to execute '#{query}'"
					s << "\nSQL state: '#{e.sqlstate}'" if e.respond_to?('sqlstate')
					raise MysqlError.new(s)
				end
			end
		end
	end
end
