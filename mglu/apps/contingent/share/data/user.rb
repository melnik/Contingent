require 'db'
require 'extensions'

require 'sha1'

class User
	STATISTICS = {
		'Роль' => 'role',
	}

	def self.list params, fields = []
		unless ( where_clauses = convert_search_params(params).compact ).empty? then
			user_ids = []; $sql.execute("SELECT *
			                             FROM role r INNER JOIN user u USING (role_id) LEFT JOIN faculty f USING (faculty_id)
			                             WHERE #{where_clauses.join ' AND '}
			                             ORDER BY login").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				user_ids << row['user_id'].to_i
			end; ( result = {} )[:total] = user_ids.size

			unless user_ids.empty? then
				for title, category in STATISTICS do
					stat = {}; $sql.execute("SELECT c.name, COUNT(*) AS value
					                         FROM #{category} c INNER JOIN user USING (#{category}_id)
					                         WHERE user_id IN (#{user_ids.join ', '})
						                 GROUP BY c.name").fetch do |row|
						stat[row['name']] = row['value'].to_i
					end; result[title] = stat
				end
			end

			return result
		end
	end

# 	private_class_method :new

	def self.create login
		begin
			$sql.execute "INSERT INTO user (login)
			              VALUES (#{login.quote})"

			User.load $sql.insert_id
		rescue MysqlError
			raise "User #{login} could not be created"
		end
	end

	def self.load oid
		if params = $sql.execute("SELECT *
		                          FROM user u LEFT JOIN role r USING (role_id)
		                          WHERE user_id = #{oid}").fetch(true) then
			User.new oid, params
		else
			raise "User ##{oid} not found"
		end
	end

	def self.disable oid
		( User.load oid ).disable
	end

	def self.delete oid
		( User.load oid ).delete
	end

	##
	# ID пользователя в БД
	attr_reader :oid

	##
	# Имя пользователя и login
	attr_accessor :name, :login

	##
	# ID и название роли пользователя в системе
	attr_reader :role_id, :role

	##
	# ID факультета, к которому приписан пользователь
	attr_reader :faculty_id

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@login         = params['u.login']
			@name          = params['u.full_name']

			@role_id       = params['u.role_id'].to_i
			@role          = params['r.name']
			@permissions   = params['r.permissions']

			@faculty_id    = params['u.faculty_id'].to_i unless params['u.faculty_id'].empty?

			@password_hash = params['u.password_hash']
			@auth_cookie   = params['u.auth_cookie']
		end
	end

	def password= password
		@password_hash = SHA1.new(password).to_s
	end

	def role_id= role_id
		unless @role_id == role_id then
			if params = $sql.execute("SELECT name, permissions
			                          FROM role
			                          WHERE role_id = #{@role_id = role_id}").fetch then
				@role        = params['name']
				@permissions = params['permissions']
			else
				raise "Role ##{role_id} not found"
			end
		end
	end

	def faculty_id= faculty_id
		unless @faculty_id == faculty_id then
			@faculty_id, @faculty = faculty_id, nil
		end
	end

	def faculty
		@faculty ||= Faculty.load @faculty_id if @faculty_id
	end

	def to_s
		login
	end

	def save
		$sql.execute "UPDATE user
		              SET login         = #{@login.quote}
		                , full_name     = #{@name.quote}
		                , password_hash = #{@password_hash.quote}
		                , role_id       = #{@role_id}
		                , faculty_id    = #{@faculty_id.quote}
		              WHERE user_id = #{@oid}"
	end

	def disable
		$sql.execute "UPDATE user SET disabled = 1 WHERE user_id = #{@oid}"
	end

	def delete
		raise 'Deleting of a user is deprecated'

		$sql.execute "DELETE FROM user WHERE user_id = #{@oid}"
	end
end
