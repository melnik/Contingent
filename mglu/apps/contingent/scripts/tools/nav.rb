require 'data/classifier'

# TODO: rewrite all this stuff and eliminate all global variables

$cut_at = get_values['cut_at']

faculty_id = get_values['faculty_id'].to_i unless get_values['faculty_id'].empty?
$add_url = ''
$add_layer_url = ''
$add_filter = ''

# Special case: foreign students department
if faculty_id == -1 then
	$add_filter = "AND s.category='foreign'"
	$add_url = '&category=foreign'
	$add_layer_url = '&faculty_id=-1'
	faculty_id = nil
end

# Special case: foreign students department
if faculty_id == 23 then
	$add_filter = "AND s.category='disabled'"
	$add_url = '&category=disabled'
	$add_layer_url = '&faculty_id=23'
	faculty_id = nil
end

if faculty_id and faculty_id.to_i < 0
	faculty_id = nil
end

if get_values['level'].empty? then
	tmpl = template 'tree/root'; $level = 0
else
	tmpl = template 'tree/node'; $level = get_values['level'].to_i
end

NODE, LEAF, NOCUT = 1, 2, 3 # TODO: remove this

return_url = get_values['return_url']
# avfix: Evil thing, but works...
return_url = get_values['_return_url'].to_s.gsub(':', '=').gsub(',', '&').gsub('@', '?') if return_url.empty?
if return_url =~ /\?/ then # BlackFix
	$url = "#{return_url}&"
else
	$url = "#{return_url}?"
end

# avfix: Evil thing once again...
$cut_suffix = "&_return_url=#{return_url.gsub('?', '@').gsub('&', ',').gsub('=', ':')}"
$cut_suffix += "&cut_at=#{$cut_at}" if $cut_at
$cut_suffix += $add_layer_url if $add_layer_url

def set_mode
	$mode = if not $cut_at then
		NOCUT
	elsif $cut_at == $level.next.to_s then
		LEAF
	else
		NODE
	end
end

set_mode

def add_subnode(tmpl, mode, params)
	case mode
		when NODE
			tmpl.add_option params['parent'], params['title'], nil, params['name'], params['layer_url'], params['hint']
		when LEAF
			tmpl.add_leaf params['parent'], params['title'], params['data_url'], params['hint']
		when NOCUT
			tmpl.add_option params['parent'], params['title'], params['data_url'], params['name'], params['layer_url'], params['hint']
	end
end

def add_faculties(tmpl)
	$sql.execute("
		SELECT f.faculty_id, f.short_name, f.name, COUNT(s.student_id) cnt
		FROM 	student s
				INNER JOIN `group` g USING (group_id)
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
		WHERE student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED}) #{$add_filter}
		GROUP BY f.faculty_id
		ORDER BY short_name
	") { |sth|
		sth.fetch { |row|
			add_subnode(tmpl, $mode, {
				'parent' => '/root/',
				'title' => "#{row['short_name']} (#{row['cnt']})",
				'data_url' => "#{$url}faculty=#{row['short_name']}#{$add_url}",
				'name' => row['faculty_id'].to_s,
				'layer_url' => "nav.rb?level=1&faculty=#{row['faculty_id']}#{$cut_suffix}",
				'hint' => row['name']
			})
		}
	}
end

def add_courses(tmpl, faculty)
	$sql.execute("
		SELECT FLOOR((g.current_term_number+1)/2) course, d.faculty_id, f.short_name, COUNT(s.student_id) cnt
		FROM 	student s
				INNER JOIN `group` g USING (group_id)
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
		WHERE d.faculty_id = #{faculty}
				AND student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED})
				#{$add_filter}
		GROUP BY course
	") { |sth|
		sth.fetch { |row|
			course = row['course'].to_i
			add_subnode(tmpl, $mode, {
				'parent' => "/root/#{faculty}/",
				'title' => "#{course} курс (#{row['cnt']})",
				'data_url' => "#{$url}faculty=#{row['short_name']}&course=#{course}#{$add_url}",
				'name' => course.to_s,
				'layer_url' => "nav.rb?level=2&faculty=#{faculty}&course=#{course}#{$cut_suffix}",
				'hint' => nil
			})
		}
	}
end

def add_departments(tmpl, faculty, course)
	faculty_name = $sql.execute("SELECT short_name FROM faculty WHERE faculty_id=#{faculty}").fetch['short_name']

	$sql.execute("
		SELECT d.faculty_id, d.department_id, d.department_num, d.name, f.short_name, COUNT(s.student_id) cnt
		FROM 	student s
				INNER JOIN `group` g USING (group_id)
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
		WHERE	d.faculty_id=#{faculty}
				AND (g.current_term_number=#{course*2-1} OR g.current_term_number=#{course*2})
				AND student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED})
				#{$add_filter}
		GROUP BY d.department_id
		ORDER BY department_num
	") { |sth|
		sth.fetch { |row|
			add_subnode(tmpl, $mode, {
				'parent' => "/root/#{faculty}/#{course}/",
				'title' => "#{faculty_name}#{row['department_num']} (#{row['cnt']})",
				'data_url' => "#{$url}faculty=#{row['short_name']}&course=#{course}&department_num=#{row['department_num']}#{$add_url}",
				'name' => row['department_id'].to_s,
				'layer_url' => "nav.rb?level=3&faculty=#{faculty}&course=#{course}&department=#{row['department_id']}#{$cut_suffix}",
				'hint' => row['name']
			})
		}
	}
end

def add_groups(tmpl, faculty, course, department)
	$sql.execute("
		SELECT g.group_id, g.group_num, current_term_number, d.department_num, f.short_name, COUNT(s.student_id) cnt
		FROM 	student s
				INNER JOIN `group` g USING (group_id)
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
		WHERE g.department_id=#{department}
				AND (g.current_term_number=#{course*2-1} OR g.current_term_number=#{course*2})
				AND student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED})
				#{$add_filter}
		GROUP BY g.group_id
		ORDER BY group_num
	") { |sth|
		sth.fetch { |row|
			add_subnode(tmpl, LEAF, {
				'parent' => "/root/#{faculty}/#{course}/#{department}/",
				'title' => "#{row['short_name']}#{row['department_num']}-#{row['current_term_number']}-#{row['group_num']} (#{row['cnt']})",
				'data_url' => "#{$url}group=#{row['short_name']}#{row['department_num']}-#{row['current_term_number']}-#{row['group_num']}#{$add_url}",
				'hint' => nil
			})
		}
	}
end

case $level
when 0 then
	# avfix: simple 'if faculty_id then' does not work, regardless to what BA says
	if faculty_id and faculty_id != 0 then
		row = $sql.execute("SELECT f.short_name, COUNT(s.student_id) AS cnt
		                    FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
		                    WHERE f.faculty_id = #{faculty_id}
		                        AND student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED})
		                        #{$add_filter}
		                    GROUP BY f.faculty_id").fetch

		tmpl.name  = "root/#{faculty_id}"
		tmpl.title = row['short_name']
		tmpl.state = "faculty_#{faculty_id}"
		tmpl.count = row['cnt']

		$level = 1; set_mode

		add_courses(tmpl, faculty_id)
	else
		tmpl.name  = 'root'
		tmpl.title = 'МГЛУ'
		tmpl.state = 'mglu'
		tmpl.count = $sql.execute("SELECT COUNT(*) AS cnt FROM student s WHERE student_state_id NOT IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED}) #{$add_filter}").fetch['cnt']

		$level = 0; set_mode

		add_faculties(tmpl)
	end
when 1 then
	add_courses(tmpl, get_values['faculty'].to_i)
when 2 then
	add_departments(tmpl, get_values['faculty'], get_values['course'].to_i)
when 3 then
	add_groups(tmpl, get_values['faculty'].to_i, get_values['course'].to_i, get_values['department'].to_i)
end

print tmpl.render
