#!/usr/bin/env ruby

require 'extensions'
require 'extensions2'
require 'mysql'
require 'rexml/document'
require 'date'

@group_cache = {}
@faculty_cache = {}
@group_names = {}

def get_group_id(group_name)

	if cached = (@group_cache ||= {})[group_name]
		return cached
	end
	
	unless group_name =~ /^(\W+)(\d*)-(\d+)(\d)$/
		raise "Cannot parse group #{group_name}"
	end
	faculty, department, term, num = $1, $2, $3, $4

	row = $db.query("
		SELECT 	g.group_id
		FROM 	`group` g
				INNER JOIN department d USING (department_id)
				INNER JOIN faculty f USING (faculty_id)
		WHERE	f.short_name = '#{faculty}'
				AND d.department_num " + unless department.empty? then " = #{department}" else " IS NULL" end + "
				AND g.current_term_number = #{term}
				AND g.group_num = #{num}
	").fetch_hash
	
	if row
		gid = @group_cache[group_name] = row['group_id'].to_i
		@group_names[gid] = group_name
		return gid
	end
	

	# Group not found, create it
	
	puts "\tCreating group #{faculty}#{department}-#{term}#{num}"
	
	row = $db.query("
		SELECT 	d.department_id
		FROM 	department d
				INNER JOIN faculty f USING (faculty_id)
		WHERE	f.short_name = '#{faculty}'
				AND d.department_num " + unless department.empty? then " = #{department}" else " IS NULL" end).fetch_hash

	raise "No department #{faculty}#{department} found" unless row
	
	department_id = row['department_id'].to_i
	$db.query "
		INSERT INTO `group` (start_year, group_num, department_id, current_term_number, __insert_id)
		VALUES (#{Date.today.year}, #{num}, #{department_id}, #{term}, #{$insert_id})"
	
	gid = @group_cache[group_name] = $db.insert_id
	@group_names[gid] = group_name
	return gid
end

def get_faculty_id(faculty)
	if cached = (@faculty_cache ||= {})[faculty]
		return cached
	end
	row = $db.query("SELECT faculty_id FROM faculty WHERE short_name = '#{faculty}'").fetch_hash
	raise "Unknown faculty #{faculty}" unless row
	return @faculty_cache[faculty] = row['faculty_id'].to_i
end

def cleanup(insert_id)
	$db.query "DELETE FROM `group` WHERE __insert_id = #{insert_id}"
	$db.query "DELETE FROM `order` WHERE __insert_id = #{insert_id}"
end

$stderr.puts "Connecting to db"
$sql = $db = Mysql.connect('localhost', 'contingent', 'faretheewell', 'contingent_old')

if ARGV[0] == '--insert-id'
	$insert_id = ARGV[1]
	$stderr.puts "Cleaning insert_id #{$insert_id}"
	cleanup($insert_id)
else
	$insert_id = [
		$db.query("SELECT MAX(__insert_id) AS insert_id FROM student").fetch_hash['insert_id'].to_i,
		$db.query("SELECT MAX(__insert_id) AS insert_id FROM `group`").fetch_hash['insert_id'].to_i,
		$db.query("SELECT MAX(__insert_id) AS insert_id FROM `order`").fetch_hash['insert_id'].to_i
	].max + 1
end
$stderr.puts "Using insert_id = #{$insert_id}"

$stderr.puts "Reading XML"
xml = REXML::Document.new(File.read('abiturient.xml'))

orders = {}

$stderr.puts "Grouping orders"
xml.root.elements.each { |el|
	students = el.elements['students'].deserialize
	
	parts = {}
	students.each { |s|
		begin
			faculty = s['group'].gsub(/\d*-.*$/, '')
			if s['group'][-1] == ?П
				s['group'][-1..-1] = ''
				study_type = 2
			else 
				study_type = 1
			end
			
			s['profession_code'] = s['profession_code'][0]
	
			s['group_id'] = get_group_id(s['group'])
			s.delete 'group'
	
			(parts[[faculty, study_type]] ||= []) << s
		rescue Exception => e
			$stderr.puts "Error: #{e.message} (#{e.backtrace[0]})"
			$failed = true
		end
	}

	orders[el.attribute('num').to_s] = parts
}

$stderr.puts "Creating orders"
orders.each_pair { |num, parts|
	parts.each_pair { |k,v|
	
		begin
		
			v.sort! { |a,b|
				"#{@group_names[a['group_id']]} #{a['name']['last']} #{a['name']['first']} #{a['name']['father']}" <=>
				"#{@group_names[b['group_id']]} #{b['name']['last']} #{b['name']['first']} #{b['name']['father']}"
			}
		
			faculty_id = get_faculty_id(k[0])
			study_type_id = k[1]
			attrs = {
				'degree' => 'дипломированных специалистов',
				'study_type_id' => study_type_id,
				'students' => v
			}
		
			$db.query("
				INSERT INTO `order` (order_type_id, order_status_id, faculty_id, number, date_created, attributes, __insert_id)
				VALUES (8, 1, #{faculty_id}, '', NOW(), #{attrs.to_xml.quote}, #{$insert_id})
			")
			
		rescue Exception => e
			$stderr.puts "\nError: #{e.message} (#{e.backtrace[0]})"
			$failed = true
		end
	}
}

if $failed
	$stderr.puts "Errors occured during import, rolling back"
	cleanup($insert_id)
end
