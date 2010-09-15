#!/usr/bin/env ruby

require 'extensions'
require 'db'

f = []
d = {}
t = {}
g = {}


params = nil

#params = convert_search_params({ 'faculty' => get_values['faculty'], 'department' => get_values['department'], 'course' => get_values['course'] }).compact
#params << "f.faculty_id = #{get_values['faculty_id'].to_i}" unless get_values['faculty_id'].empty?
#params << "d.department_id = #{get_values['department_id'].to_i}" unless get_values['department_id'].empty?

$sql.execute("	SELECT	group_id, f.short_name, d.department_num, current_term_number, group_num
				FROM 	`group` g
						INNER JOIN department d USING (department_id)
						INNER JOIN faculty f USING (faculty_id)
				#{"WHERE #{ params.join(' AND ')}" unless params.empty? }").fetch { |r|

	f << "'#{r['short_name']}'"

	if d[r['short_name']] == nil
		d[r['short_name']] = ["'#{r['department_num']}'"]
	else
		d[r['short_name']] << "'#{r['department_num']}'"
	end

	term = r['current_term_number'].to_i
	course = (term / 2.0).round
	if t["#{r['short_name']}#{r['department_num']}"] == nil
		t["#{r['short_name']}#{r['department_num']}"] = [ term ]
	else
		t["#{r['short_name']}#{r['department_num']}"] << term
	end

	if g["#{r['short_name']}#{r['department_num']}-#{term}"] == nil
		g["#{r['short_name']}#{r['department_num']}-#{term}"] = { r['group_num'].to_i => r['group_id'].to_i }
	else
		g["#{r['short_name']}#{r['department_num']}-#{term}"][r['group_num'].to_i] = r['group_id'].to_i
	end
}

print "departments = [];\ncourses = [];\nterms = [];\ngroup_names = [];\ngroup_ids = [];\n\n"

print "faculties = [#{f.sort.uniq.join(', ')}];\n\n";

d.each_pair { |faculty, departments| print "departments['#{faculty}'] = [#{departments.sort.uniq.join(', ')}];\n" }
print "\n"

t.each_pair { |dep, terms|
	print "terms['#{dep}'] = [#{terms.collect { |x| x.to_i }.sort.uniq.join(', ')}];\n"
}

print "\n"

g.each_pair { |term, groups|
	group_names = []
	group_ids = []
	groups.keys.sort.each { |k|
		group_names << k
		group_ids << groups[k]
	}
	print "group_names['#{term}'] = [#{group_names.join(', ')}];\n"
	print "group_ids['#{term}'] = [#{group_ids.join(', ')}];\n"
}
