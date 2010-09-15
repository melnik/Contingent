#!/usr/bin/env ruby

require 'mysql'

$sql = Mysql.init
$sql.options(Mysql::SET_CHARSET_NAME, $db_encoding = 'utf8')
$sql.connect('localhost', 'mglu', 'wurahd6E', 'mglu')

def query(qstr, fields = ["name"])
	#$stderr.puts qstr.gsub(/\s+/, ' ')
	res = []
	$sql.query(qstr).each_hash { |h|
		res << if block_given?
			yield h
		else
			row = {}
			fields.each { |f| row[f.intern] = h[f] }
			row
		end
	}
	res
end

def groups(depid)
	query("	SELECT		f.short_name AS f, d.department_num AS d,
				g.current_term_number AS t, g.group_num AS g,
				g.group_id AS gid, g.language AS lang, sf.name AS sf, COUNT(*) AS cnt
		FROM		student s
				RIGHT JOIN `group` g USING (group_id)
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
				INNER JOIN study_form sf USING (study_form_id)
		WHERE		g.department_id = #{depid}
		GROUP BY	s.group_id
	") { |h| [ "%s%s-%s%d  ( #%d; %s;  %s;  %d )" % [h['f'], h['d'], h['t'], h['g'], h['gid'], h['lang'], h['sf'], h['cnt']], [] ] }
end

def departments(fid)
	query("	SELECT	d.department_id AS id, d.name AS name, f.short_name AS f, d.department_num AS d
		FROM	department d
			INNER JOIN faculty f USING (faculty_id)
		WHERE	faculty_id = #{fid}
	") { |h| [ "#{h['f']}#{h['d']} (#{h['name']})", groups(h['id']) ] }
end 

$faculties = query("SELECT * FROM faculty") { |h| [ "#{h['short_name']} (#{h['name']})", departments(h['faculty_id']) ] }

$prev = ''
def display(data, indent)
	name, children = data
	
	print(if name.gsub(/ .*/, '')[0..-2] != $prev.gsub(/ .*/, '')[0..-2] then "\033[31;1m" else "\033[;m" end)
	$prev = name
	
	puts "\t"*indent + name
	children.sort.each { |child| display(child, indent + 1) }
end

$faculties.each { |f| display f, 0; puts "" }

print "\033[;m"
