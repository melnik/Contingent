#!/usr/bin/env ruby
$KCODE = 'UTF8'

require 'mysql'

$sql = Mysql.init
$sql.options(Mysql::SET_CHARSET_NAME, $db_encoding = 'utf8')
$sql.connect('localhost', 'mglu', 'wurahd6E', 'mglu')

def parse_dep(dep_name)
	raise "Group format invalid" unless dep_name =~ /^(.+?)(\d+)$/
	[$1, $2.to_i]
end

def dep_to_id(arg)
	arg = parse_dep(arg) unless arg.is_a? Array
	faculty, department = arg
	did = nil
	$sql.query("
		SELECT	d.department_id AS id
		FROM	department d
			INNER JOIN faculty f USING (faculty_id)
		WHERE	d.department_num = #{department}
			AND f.short_name = '#{faculty}'
	").each_hash { |h| did = h['id'].to_i }
	did
end

def parse_group(group_name)
	raise "Group format invalid" unless group_name =~ /^(.+?)(\d+)-(\d+)(\d)$/
	[$1, $2.to_i, $3.to_i, $4.to_i]
end

def group_to_id(arg)
	arg = parse_group(arg) unless arg.is_a? Array
	faculty, department, term, group = arg
	gid = nil
	$sql.query("
		SELECT	g.group_id AS gid
		FROM	`group` g
			INNER JOIN department d USING (department_id)
			INNER JOIN faculty f USING (faculty_id)
		WHERE	f.short_name = '#{faculty}'
			AND d.department_num = #{department}
			AND g.current_term_number = #{term}
			AND g.group_num = #{group}
	").each_hash { |h| gid = h['gid'].to_i }
	gid
end

def faculty_to_id(name)
	fid = nil
	$sql.query("SELECT faculty_id FROM faculty WHERE short_name = '#{name}'").each_hash { |h| fid = h['faculty_id'].to_i }
	raise "Faculty #{name} not found" unless fid
	fid
end

$insert_id = 100

def query(str)
	puts str.strip.gsub(/\s+/, ' ') + ';' if $verbose
	$sql.query str unless $noop
end

def mkdep(dep_name, dep_desc)
	raise "Department #{dep_name} already exists" if dep_to_id(dep_name)
	faculty, num = parse_dep(dep_name)
	query "	INSERT INTO department(faculty_id, name, department_num, __insert_id)
		VALUES(#{faculty_to_id(faculty)}, '#{dep_desc}', #{num}, #{$insert_id})"
end

def mvdep(old_name, new_name)
	raise "Department #{old_name} not found" unless old_id = dep_to_id(old_name)
	raise "Department #{new_name} already exists" if dep_to_id(new_name)
	faculty, num = parse_dep(new_name)
	query "UPDATE department SET faculty_id = #{faculty_to_id(faculty)}, department_num = #{num} WHERE department_id = #{old_id}"
end

def setname(dep, newname)
	raise "Department #{old_name} not found" unless old_id = dep_to_id(dep)
	query "UPDATE department SET name = '#{newname}' WHERE department_id = #{old_id}"
end

def mkgrp(name)
	raise "Group #{name} already exists" if group_to_id(name)
	faculty, department, term, group = parse_group(name)
	raise "Department #{faculty}#{department} not found" unless dep_id = dep_to_id("#{faculty}#{department}")
	query "	INSERT INTO `group` (start_year, group_num, department_id, current_term_number)
		VALUES (#{2008-(term-1)/2}, #{group}, #{dep_id}, #{term})"
end

def mvgrp(old_name, new_name)
	raise "Group #{old_name} not found" unless old_id = group_to_id(old_name)
	raise "Group #{new_name} already exists" if group_to_id(new_name)
	faculty, department, term, group = parse_group(new_name)
	raise "Department #{faculty}#{department} not found" unless dep_id = dep_to_id("#{faculty}#{department}")
	query "	UPDATE	`group`
		SET	department_id        = #{dep_id},
			start_year           = #{2008 - (term-1)/2},
			current_term_number  = #{term},
			group_num            = #{group}
		WHERE	group_id = #{old_id}"
end

def xchgdep(name1, name2)
	raise "Department #{name1} not found" unless id1 = dep_to_id(name1)
	raise "Department #{name2} not found" unless id2 = dep_to_id(name2)
	f1, d1 = parse_dep(name1)
	f2, d2 = parse_dep(name2)
	query "UPDATE department SET faculty_id = #{faculty_to_id(f2)}, department_num = #{d2} WHERE department_id = #{id1}"	
	query "UPDATE department SET faculty_id = #{faculty_to_id(f1)}, department_num = #{d1} WHERE department_id = #{id2}"
end

def grpid(name)
	if gid = group_to_id(name) then
		puts gid
	else
		raise "Group #{name} not found"
	end
end

def depid(name)
	if depid = dep_to_id(name) then
		puts depid
	else
		raise "Department #{name} not found"
	end
end	

def execute(line)	
	args = []; line.scan(/(['"]([^\\"']|\\.)*['"]|[^\s"']+)/) { |x|
		x = x[0]
		x = $1 if x =~ /^['"](.*)["']$/
		args << x
	}
	cmd = args.shift
	query("-- " + cmd + " " + args.map { |x| "'#{x}'" }.join(', '))
	self.method(cmd).call(*args)
end

args = []
ARGV.each { |arg| case arg
	when "-v" then $verbose = true
	when "-n" then $noop = true
	else args << arg
end }

unless args.empty?
	cmd = args.shift
	query("-- " + cmd + " " + args.map { |x| "'#{x}'" }.join(', ')) if cmd !~ /id$/
	self.method(cmd).call(*args)
	exit
end

if $stdin.tty?
	require 'readline'
	while line = Readline.readline('grouptool> ') do
		Readline::HISTORY.push line
		begin
			execute line
		rescue Exception => e
			puts "Error: #{e.to_s}"
		end
	end
else
	$stdin.each_line { |line| execute line }
end
