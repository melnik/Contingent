require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

tmpl = template 'order/index'

tmpl.faculty_id = u.faculty_id

print tmpl.render
