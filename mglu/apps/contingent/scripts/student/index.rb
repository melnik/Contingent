require 'auth'

( u = auth_user_current ).require_permissions 'student_view_short'

tmpl = template 'student/index'

tmpl.faculty_id = u.faculty_id
tmpl.student_view = u.has_permissions('student_view')

print tmpl.render
