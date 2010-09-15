require 'auth'

( cu = auth_user_current ).require_permissions 'user_edit'

require 'data/user'
require 'data/classifier'

tmpl = template 'user/item'

unless get_values['user_id'].empty? then
	tmpl.user_id = ( u = User.load get_values['user_id'].to_i ).oid
end

if post_values['save'] then
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	if get_values['user_id'].empty? then
		tmpl.status = begin
			tmpl.user_id = ( u = User.create attributes['login'] ).oid
			u.faculty_id = cu.faculty_id if cu.faculty_id
			:ok
		rescue # TODO: exception must be determined
			:failed
		end
	else
		u.login = attributes['login']
	end

	if u then
		u.name       = attributes['name']

		u.role_id    = attributes['role_id'].to_i
		u.faculty_id = attributes['faculty_id'].empty? ? nil : attributes['faculty_id'].to_i unless cu.faculty_id

		u.save
	end
end

role    = Classifier::Role.new
faculty = Classifier::Faculty.new

if u then
	tmpl.name    = u.name
	tmpl.login   = u.login
	role.select    u.role_id
	faculty.select u.faculty_id
else
	faculty.select cu.faculty_id if cu.faculty_id
end

(tmpl.place_role role).display_empty = false

tmpl.place_faculty faculty, cu.faculty_id.nil?

print tmpl.render
