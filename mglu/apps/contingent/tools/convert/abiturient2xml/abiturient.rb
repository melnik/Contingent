require 'dbi'
require 'date'

require 'extensions'

@DEPT = {}
@FACULTY = {}
require 'dept'

server = '192.168.13.1'
dbname = 'abiturient2005'
trusted_connection = 'no'
username = 'ostrikov'
password = 'war'

#server = '195.19.38.195'
#username = 'av'
#password = 'aza4nfx5cz'

#server_cont = '195.19.33.15'
#dbname_cont = 'contingent'

$START_YEAR = Date.today.year
$group_id = 1000

$stderr.puts "Connecting to DB"

$db = DBI.connect("dbi:ADO:Driver={SQL Server};Server=#{server};DataBase=#{dbname};UID=#{username};PWD=#{password};Trusted_Connection=#{trusted_connection};", "", "", 'AutoCommit' => true)

#print '-- '
#$cont = DBI.connect("dbi:ADO:Driver={MySQL ODBC 3.51 Driver};Server=#{server_cont};DataBase=#{dbname_cont};User=export;Password=Ahxuh8oh;", "", "", 'AutoCommit' => true)

@orders = {}
@groups = {}
@orders_fac = {}

def get_group(name, sc, ssc)
	name.gsub!(/\D*$/, '').gsub!('ÞÐ', 'ÞÐ1')

	if @groups[name] then
		return @groups[name]['id']
	else
		g = @groups[name] = {}
		g['id'] = ($group_id += 1)
		g['sc'] = sc.strip
		g['ssc'] = ssc.strip
		raise "No groupname match #{name}" unless name.strip =~ /^(.*)(\d+)-(.*)(.)$/
		fac = $1
		dept = $2
		g['term'] = $3
		g['num'] = $4
		g['dept'] = @DEPT[fac + dept]
		g['faculty'] = @FACULTY[fac]

		return g['id']
	end
end

#puts "DELETE FROM `group` WHERE group_id > #{$group_id};"
#puts "DELETE FROM `order` WHERE order_type_id = 8 AND YEAR(date_created) = #{Date.today.year};"

count = 0

uniq_check = %w( card_number name )
uniq = uniq_check.collect { |x| {} }

$stderr.puts "Reading orders"

$db.execute('
SELECT Familiya, Imya, Otchestvo, pil.Zachnum, Pol, Rojd, gr.Grazhd_ID,
	Obshezhitie, Grupa_Name, Unspsc_spec, Unspsc_napr, Prikaz_num,
	pasport_ser, pasport_nom
FROM PERSON p
LEFT JOIN pasport ON pasport.person_id = p.person_id
LEFT JOIN person_info pi ON p.person_id=pi.person_id
LEFT JOIN person_infol pil ON p.person_id=pil.person_id
LEFT JOIN Grazhd gr ON pil.grazhdanstvo=gr.grazhd_id
INNER JOIN dbo.Person_to_Grupa ptg ON p.person_id=ptg.person_id
INNER JOIN dbo.Grupa g ON ptg.grupa_id=g.grupa_id
INNER JOIN Person_to_Prikaz ptp ON p.person_id=ptp.person_id
').fetch { |row|

	ar = @orders[row['Prikaz_num']]
	ar = [] if ar.nil?

	s = {}
	s['name'] = {
		'first' => row['Imya'].strip,
		'last' => row['Familiya'].strip,
		'father' => row['Otchestvo'].strip
	}
	s['card_number'] = row['Zachnum'].strip
	s['gender_id'] = (row['Pol'] == 'Ì') ? 1 : 2
	s['birth_date'] = Date.new(*(row['Rojd'][0..9].gsub(/\//, '-').split('-').collect { |x| x.to_i }))

	s['citizenship_id'] = case row['Grazhd_ID'].to_i
	when 1 then 1
	when 3 then 3
	else 5
	end

	# Group split
#	s['group'] = get_group(row['Grupa_Name'], row['Unspsc_spec'], row['Unspsc_napr'])

	s['group'] = row['Grupa_Name'].strip
	s['profession_code'] = [
		unless row['Unspsc_spec'] =~ /- */ then row['Unspsc_spec'].strip end,
		unless row['Unspsc_napr'] =~ /- */ then row['Unspsc_napr'].strip end
	]

	s['passport'] = ''
	s['passport'] += row['pasport_ser'].strip if row['pasport_ser'].strip != '-'
	s['passport'] += ' '
	s['passport'] += row['pasport_nom'].strip if row['pasport_nom'].strip != '-'
	s['passport'].strip!

	# Memorize order faculty by group
	#@orders_fac[row['Prikaz_num']] = @groups[row['Grupa_Name']]['faculty']

	ar << s

	@orders[row['Prikaz_num']] = ar
	
	uniq_check.each_with_index { |field, index| (uniq[index][s[field]] ||= []) << s }
	
	$stderr.print "." if (count % 50) == 0
	$stderr.flush
	
	count += 1
}

$stderr.puts "\nChecking exported data"

issues = File.new('issues.xml', 'w')
issues.puts '<?xml version="1.0" encoding="windows-1251"?>'
issues.puts '<issues>'

uniq_dups = uniq_check.collect { |x| 0 }
uniq_check.each_with_index { |field, index|
	issues.puts "\t<duplicates field=\"#{field}\">"
	uniq[index].each_pair { |value, students|
		next if students.length <= 1
		uniq_dups[index] += 1
		$stderr.puts "Warning: duplicate field #{field} (#{value}):"
		issues.puts "\t\t<case value=\"#{value}\">"
		students.each { |student|
			name = student['name']['last'] + ' ' + student['name']['first'] + ' ' + student['name']['father']
			group = student['group']
			$stderr.puts "\t\t#{name} (#{group})"
			issues.puts "\t\t\t<student><name>#{name}</name><group>#{group}</group></student>"
		}
		issues.puts "\t\t</case>"
	}
	issues.puts "\t</duplicates>"
}

issues.puts "</issues>"
issues.close

$stderr.puts "Writing result"

if ARGV[0].nil? or ARGV[0].empty?
	out = $stdout
else
	out = File.new ARGV[0], 'w'
end

out.print "<?xml version=\"1.0\" encoding=\"windows-1251\"?>\n<orders>"
@orders.each_pair { |num, o|
	h = { 'students' => o }.to_xml
	faculty = o[0]['group'].gsub(/\d*-.*$/, '')
	out.puts "\t<order num='#{num}' faculty='#{faculty}'>#{h}</order>"
}
out.puts "</orders>"
out.close unless out == $stdout

$stderr.puts "\
All done
	#{count} student(s)
	#{@orders.keys.length} order(s)"
	
have_issues = false
uniq_check.each_with_index { |field, index|
	next if uniq_dups[index] == 0
	unless have_issues
		$stderr.puts "Issues:"
		have_issues = true
	end
	puts "\t#{uniq_dups[index]} value(s) of field '#{field}' are not unique"
}

puts ""
