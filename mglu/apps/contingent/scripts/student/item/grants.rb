require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'

tmpl = template 'student/item/grants'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i ).oid

print tmpl.render
