require 'auth'
( u = auth_user_current ).require_permissions 'user_edit'

tmpl = template 'user/list_toolbar'

print tmpl.render
