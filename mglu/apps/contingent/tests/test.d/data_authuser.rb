require 'date'

require 'share/auth'

class Test_AuthUser < Test::Unit::TestCase
	def test_01_login
		session = {}
		u = AuthUser.login('greycat', '123', session)

		assert_equal 1, u.faculty_id
		assert_equal [ 'student_edit', 'order_project', 'order_activate', 'user_edit', 'student_view_short' ], u.perms
		assert_equal 17, u.user_id
		assert_equal 'יץ', u.faculty

		u = AuthUser.current(session)

		assert_equal 1, u.faculty_id
		assert_equal [ 'student_edit', 'order_project', 'order_activate', 'user_edit', 'student_view_short' ], u.perms
		assert_equal 17, u.user_id
		assert_equal 'יץ', u.faculty
	end
end
