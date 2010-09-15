require 'data/group'
require 'data/student'

class Test_Group < Test::Unit::TestCase
	def test_01_load
		# Find a studying student & an associated group
		Student.list( { 'student_state' => 'studying' }, %w( student_id group_id ) ) do |student_id, group_id|
			@@sid, @@gid = student_id, group_id; break
		end

		# Load group with ID=@@gid
		g = Group.load @@gid

		# Check if student with ID=@@sid is in that group
		assert_equal Student.list({
			'student_id' => @@sid,
			'group'      => g.name,
		})[:total], 1
	end

	def test_02_name
		# Load group with ID=@@gid corresponding Department & Faculty objects
		g = Group.load @@gid
		d = g.department
		f = g.faculty

		# ...and check if their names match their attributes
		assert_equal "#{f}#{d.number}-#{g.term_number}#{g.number}", g.name
		assert_equal "#{d}-#{g.term_number}#{g.number}",            g.name
		assert_equal "#{g}",                                        g.name
	end
end
