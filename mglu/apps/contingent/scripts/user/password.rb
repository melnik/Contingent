require 'auth'

( cu = auth_user_current ).require_login

require 'data/user'

tmpl = template 'user/password'

tmpl.user_id = ( u = unless get_values['user_id'].empty? then
	auth_user_current.require_permissions 'user_edit'

	User.load get_values['user_id'].to_i
else
	User.load cu.user_id
end ).oid

if pass1 = post_values['pass1'] and pass2 = post_values['pass2'] then
	tmpl.status = if pass1 == pass2 then
		u.password = pass1; u.save
		:ok
	else
		:failed
	end
end

tmpl.login = u.login

print tmpl.render
