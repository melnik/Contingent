#!/usr/bin/env ruby

require 'db'

$sql.execute('SELECT * FROM faculty INNER JOIN department USING (faculty_id)').fetch { |r|
	puts "@DEPT['#{r['short_name']}#{r['department_num']}'] = #{r['department_id']}"
}

$sql.execute('SELECT * FROM faculty').fetch { |r|
	puts "@FACULTY['#{r['short_name']}'] = #{r['faculty_id']}"
}
