require 'auth'

( u = auth_user_current ).require_permissions 'user_edit'

tmpl = template 'user/index'

tmpl.faculty_id = u.faculty_id

print tmpl.render
