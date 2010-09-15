require 'extensions'
require 'db'

def make_groupcontrol(id, params)

	tmpl = template 'widgets/group'
	tmpl.id = id
	tmpl.set = false

	fixed = {}

	faculty_id = params['faculty_id']
	faculty = $sql.execute("SELECT short_name FROM faculty WHERE faculty_id = #{params['faculty_id'].to_i}").fetch['short_name'] unless params['faculty_id'].empty?
	fixed['faculty'] = true unless faculty.empty?

	department_id = nil
	unless params['department_id'].empty?
		h = $sql.execute("SELECT f.faculty_id, f.short_name, d.department_num FROM department d INNER JOIN faculty f USING (faculty_id) WHERE d.department_id = #{params['department_id'].to_i}").fetch
		department = h['department_num']
		faculty = h['short_name']
		department_id = params['department_id']
		faculty_id = h['faculty_id']
		fixed['department'] = true
		fixed['faculty'] = true
	end

	unless params['course'].empty?
		course = params['course'].to_i
		fixed['course'] = true
	end

	unless params['group_id'].empty?
		h = $sql.execute("	SELECT	f.short_name, d.department_num, g.current_term_number, g.group_id
							FROM	`group` g
									INNER JOIN department d USING (department_id)
									INNER JOIN faculty f USING (faculty_id)
							WHERE	group_id = #{params['group_id'].to_i}").fetch
		tmpl.set = true
	
		faculty = h['short_name']
		department = h['department_num']
		course = (h['current_term_number'].to_i / 2.0).round
		group = h['group_id']
	end

	faculty_id = department_id = nil unless fixed['faculty']
	department_id = nil unless fixed['department']

	tmpl.faculty = faculty
	tmpl.department = department
	tmpl.course = course
	tmpl.group = group
	tmpl.fixed = fixed
	tmpl.faculty_id = faculty_id
	tmpl.department_id = department_id

	tmpl.render
	
end

