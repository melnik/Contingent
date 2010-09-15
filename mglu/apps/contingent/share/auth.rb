require 'db'
require 'extensions'
require 'sha1'

class AuthUser
	##
	# User ID in SQL database, used to form auth cookies
	attr_reader :user_id

	##
	# Faculty ID in SQL database
	attr_reader :faculty_id

	##
	# Full faculty name that user is bound to
	attr_reader :faculty_full

	##
	# Abbreviation of name of faculty that user is bound to
	attr_reader :faculty

	##
	# Category of faculty that user is bound to
	attr_reader :faculty_category

	##
	# Permissions array, can be grepped to check if some permission
	# is granted
	attr_reader :perms

#	private_class_method :new

	##
	# Creates an instance of AuthUser, based on parameters from SQL
	# database or, if, if called without arguments, creates an
	# anonymous user with minimal permissions.
	def initialize(user_id = nil, faculty_id = nil, faculty_full = nil, faculty = nil, perms = nil, faculty_category = nil)
		if user_id
			@user_id = user_id
			@faculty_id = faculty_id ? faculty_id.to_i : nil
			@faculty_full = faculty_full
			@faculty = faculty
			@perms = perms ? perms.split(/,/) : []
			@faculty_category = faculty_category
		else
			@user_id = @faculty_id = @faculty_full = @faculty = @faculty_category = nil
			@perms = [ 'student_view_short' ]
		end
	end

	##
	# Authenticates user, i.e. checks that he's really what he
	# states in session variable user_id and retrieves user data
	# from SQL table
	def self.current(session, request)
		if session['user_id'] then
			user_id = session['user_id'].to_i
			cookie = session['auth_cookie']
			good_cookie, faculty_id, faculty_full, faculty, perms, faculty_category = $sql.execute(
				"SELECT auth_cookie, u.faculty_id, f.name, f.short_name, permissions, f.category
				 FROM user u INNER JOIN role r ON u.role_id=r.role_id
				 LEFT JOIN faculty f ON f.faculty_id=u.faculty_id
				 WHERE user_id=#{user_id} AND disabled = 0").fetch_array
			if cookie != good_cookie
				return self.new
			else
				return self.new(user_id, faculty_id, faculty_full, faculty, perms, faculty_category)
			end
		elsif request.header['Ssl_client_s_dn']
			ssl_serial = nil
			request.header['Ssl_client_s_dn'].split(/\//).each { |l|
				ssl_serial = $1.to_i if l =~ /^serialNumber=(\d+)$/
			}
			p ssl_serial
			user_id, faculty_id, faculty_full, faculty, perms, faculty_category = $sql.execute(
				"SELECT u.user_id, u.faculty_id, f.name, f.short_name, permissions, f.category
				 FROM user u INNER JOIN role r ON u.role_id=r.role_id
				 LEFT JOIN faculty f ON f.faculty_id=u.faculty_id
				 WHERE ssl_serial=#{ssl_serial} AND disabled = 0").fetch_array
			return self.new(user_id, faculty_id, faculty_full, faculty, perms, faculty_category)
		else
			return self.new
		end
	end

	def self.login(login, password, session)
		user_id, password_hash, faculty_id, faculty_full, faculty, perms, faculty_category = $sql.execute(
			"SELECT user_id, password_hash, u.faculty_id, f.name, f.short_name, permissions, f.category
			 FROM user u INNER JOIN role r ON u.role_id=r.role_id
			 LEFT JOIN faculty f ON f.faculty_id=u.faculty_id
			 WHERE login=#{login.quote}").fetch_array
		return nil if SHA1.new(password).to_s != password_hash

		t = Time.new
		cookie = SHA1.new("#{t.to_i} #{t.tv_usec}").to_s
		$sql.execute("UPDATE user SET auth_cookie='#{cookie}' WHERE user_id=#{user_id}")

		session['user_id'] = user_id
		session['auth_cookie'] = cookie

		return self.new(user_id.to_i, faculty_id, faculty_full, faculty, perms, faculty_category)
	end

	##
	# Throws exception SecurityError if user is not permitted to do action "req_perm"
	def require_permissions(req_perm)
		raise SecurityError.new('Not allowed - user role does not permit to do such action!') if @perms.grep(req_perm).empty?
	end

	##
	# Throws exception SecurityError if user is not logged in
	def require_login
		raise SecurityError.new('Not allowed - login required!') if @user_id.nil?
	end

	##
	# Log out user and delete its credentials in session (cookies, etc)
	def logout(session)
		if user_id then
			$sql.execute("UPDATE user SET auth_cookie=NULL WHERE user_id=#{user_id}")
			session['user_id'] = nil
			session['auth_cookie'] = nil
		end
	end

	def has_permissions(req_perm)
		not @perms.grep(req_perm).empty?
	end
end

##
# Shortcut to return current user AuthUser object (previously logged in
# session)
def auth_user_current
	AuthUser.current(session, request)
end

##
# Shortcut to log in user with login and password and return AuthUser
# object
def auth_user_login(login, password)
	AuthUser.login(login, password, session)
end

##
# Shortcut to log out user and delete its credentials in session
def auth_user_logout
	AuthUser.current(session, request).logout(session)
end
