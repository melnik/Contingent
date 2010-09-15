require 'auth'

redirect = get_values['redirect'] || post_values['redirect']

if post_values['login'] then
	if auth_user_login(post_values['login'], post_values['password'])
		response.redirect(redirect)
	else
		response.redirect("/index.rb?mode=login&args=redirect:#{redirect}")
	end
end

tmpl = template('login')
tmpl.redirect = redirect
print tmpl
