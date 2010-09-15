require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

tmpl = template 'order/list_toolbar'

print tmpl.render
