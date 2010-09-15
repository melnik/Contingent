require 'auth'

( u = auth_user_current ).require_permissions('student_view')

tmpl = template 'student/item/address_show'

if get_values['reset']
	response.redirect "kladr.rb?address_type=#{get_values['type']}"
else
	tmpl.address_type = get_values['type']
	tmpl.address = get_values['address']
	tmpl.okato = get_values['okato']
end

print tmpl.render
