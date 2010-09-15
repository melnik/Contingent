require 'auth'

( u = auth_user_current ).require_permissions 'student_view_short'

tmpl = template 'student/list_toolbar'

print tmpl.render
