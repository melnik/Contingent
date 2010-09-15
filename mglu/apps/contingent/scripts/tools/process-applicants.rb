
@insert_id = 22 # Update this ID every term

@group_cache = {}
@faculty_cache = {}
@group_names = {}

@messages = []

CREATOR_ID = $sql.execute("SELECT user_id FROM user WHERE login = 'enrollment'").fetch_hash['user_id'].to_i

def get_group_id(group_name)

    if cached = (@group_cache ||= {})[group_name]
        return cached
    end

    unless group_name =~ /^(\W+)(\d*)-(\d+)(\d)$/
        raise "Cannot parse group '#{group_name}' (#{group_name.inspect})"
    end
    faculty, department, term, num = $1, $2, $3, $4

    row = $sql.execute("
        SELECT  g.group_id
        FROM    `group` g
                INNER JOIN department d USING (department_id)
                INNER JOIN faculty f USING (faculty_id)
        WHERE   f.short_name = '#{faculty}'
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

    #puts "\tCreating group #{faculty}#{department}-#{term}#{num}"

    row = $sql.execute("
        SELECT  d.department_id
        FROM    department d
                INNER JOIN faculty f USING (faculty_id)
        WHERE   f.short_name = '#{faculty}'
                AND d.department_num " + unless department.empty? then " = #{department}" else " IS NULL" end).fetch_hash

    raise "No department #{faculty}#{department} found" unless row

    department_id = row['department_id'].to_i
    $sql.execute "
        INSERT INTO `group` (start_year, group_num, department_id, current_term_number, __insert_id)
        VALUES (#{Date.today.year}, #{num}, #{department_id}, #{term}, #{@insert_id})"

    gid = @group_cache[group_name] = $sql.insert_id
    @messages << "Created group #{gid} = #{faculty}#{department}-#{term}#{num}"
    @group_names[gid] = group_name
    return gid
end

def get_faculty_id(faculty)
    if cached = (@faculty_cache ||= {})[faculty]
        return cached
    end
    row = $sql.execute("SELECT faculty_id FROM faculty WHERE short_name = '#{faculty}'").fetch_hash
    raise "Unknown faculty #{faculty}" unless row
    return @faculty_cache[faculty] = row['faculty_id'].to_i
end

def rollback(insert_id)
	$sql.execute "DELETE FROM `group` WHERE __insert_id = #{insert_id}"
	$sql.execute "DELETE FROM `order` WHERE __insert_id = #{insert_id}"
	$sql.execute "DELETE FROM student WHERE __insert_id = #{insert_id}"
end


def message(msg)
	response << msg.gsub("\n", "<br/>")
	response.flush
end
response.sendHeaders

response << "<html><body><b>Processing, please wait...</b><hr/>\n"
response.flush

begin

file = request.files['data']
filename = file.original_filename

raw_data = file.read
if raw_data[0..4] == '<?xml'
	message "Reading #{filename} as XML dump... "
	@data = REXML::Document.new(
		'<?xml version="1.0" encoding="windows-1251"?><__root__ class="Hash">' +
		raw_data + '</__root__>'
	).root.deserialize
else
	message "Reading #{filename} as Ruby Marshal dump... "
	@data = Marshal.load raw_data
	message "done.\nConverting to utf-8..."
	iconv = Iconv.new('utf-8', 'windows-1251')
	count = 0
	@data.each_pair { |table_name, table|
		table.each { |row|
			row.each_key { |column|
				if row[column].is_a? String
					str = row[column]
					attempts = str.length + 10
					begin
						row[column] = iconv.iconv(str)
					rescue Iconv::IllegalSequence => e
						if attempts == 0
							message "In table #{table_name}, row #{row.inspect}:"
							raise
						end
						attempts -= 1
						str[e.failed] = '?'
						retry
					end
					count += 1
					message "." if (count % 10000 == 0)
				end
			}
		}
	}
	message "done.\n"
end


message "Hashing tables... "

# hashing tables
@hashes = {}
tables = {
	:person_info => :Person_ID,
	:person_infol => :Person_ID,
	:pasport => :Person_ID,
	:person_to_prikaz => :Person_ID,
	:person_to_grupa => :Person_ID,
	:grupa => :Grupa_ID
}
tables.each_pair { |table_name, hashed_fields|
	hashed_fields = [hashed_fields] unless hashed_fields.is_a? Array
	hashed_fields.each { |field|
		hash = {}
		(@data[table_name] || []).each { |row| (hash[row[field]] ||= []) << row }
		(@hashes[table_name] ||= {})[field] = hash
	}
}

def find_row(table, keyname, keyvalue)
	rows = (@hashes[table][keyname][keyvalue] || [])
	raise "Duplicates for table #{table}, #{keyname} = #{keyvalue}" if rows.length > 1 and rows.inject(false) { |a,r| a or (r != rows[0]) }
	rows[0]
end

message "done.\nRolling back previous upload... "
rollback(@insert_id)

message "done.\nProcessing students (#{@data[:person].length} total)..."

@orders = {}

def find_order(order_row, student)
	return @orders[order_row[:Prikaz_num]] if @orders[order_row[:Prikaz_num]]
	
	order = {
		:__insert_id => @insert_id,
	
		:order_type_id => 8,
		
		:order_status_id => if order_row[:locked].to_i == 1 then
			Classifier::OrderStatus::FROZEN
		else
			Classifier::OrderStatus::PROJECT
		end,
		
		:faculty_id => Group.load(student['group_id']).department.instance_variable_get('@faculty_id'),
		
		:number => order_row[:Prikaz_num],
		
		:date_created => order_row[:dt].to_s.split(' ')[0].gsub('/', '-').to_date,
		
		:creator_id => auth_user_current.user_id,
				
		:attributes => {
		
			'student_state_id' => Classifier::StudentState::STUDYING,
			
			'enrollment_date' => Date.new(Date.today.year, 9, 1),
			
			'resolution' => Document.new(
				order_row[:ProtokolDate].to_s.split(' ')[0].gsub('/', '-').to_date,
				order_row[:ProtokolNum].to_s.strip
			),
			
			'approval' => Document.new(
				order_row[:ProtokolDate1].to_s.split(' ')[0].to_s.gsub('/', '-').to_date,
				order_row[:ProtokolNum1].to_s.strip
			),
			
			'study_type_id' => if student['agreement'][:num].to_s.empty? then
				Classifier::StudyType::BUDGET
			else
				Classifier::StudyType::CONTRACT
			end,
			
			'degree_code' => '65',
			
			'category' => '',
			
			'students' => []
		}
	}
	
	@messages << "Creating order #{order_row[:Prikaz_num]} by student #{student.inspect}"
	
	@orders[order_row[:Prikaz_num]] = order
	order
end

count = 0
real_count = 0
@data[:person].each_with_index { |person, count|
	pid = person[:Person_ID]
	person_info = find_row(:person_info, :Person_ID, pid)
	person_infol = find_row(:person_infol, :Person_ID, pid)
	passport = find_row(:pasport, :Person_ID, pid)
	
	order = find_row(:person_to_prikaz, :Person_ID, pid); next unless order
	person_group = find_row(:person_to_grupa, :Person_ID, pid); next unless person_group
	group = find_row(:grupa, :Grupa_ID, person_group[:Grupa_ID]); next unless group
	
	s = {}
	
	s['name'] = {
		'first' => person[:Imya].to_s.strip,
		'last' => person[:Familiya].to_s.strip,
		'father' => person[:Otchestvo].to_s.strip
	}
	
	s['card_number'] = person_infol[:Zachnum].to_s.strip
	
	s['gender_id'] = person_info[:Pol] == 'Ж' ? 2 : 1
	
	s['birth_date'] = person[:Rojd].to_s.split(' ')[0].gsub('/','-').to_d
	
	s['citizenship_id'] = case person_infol[:Grazhdanstvo].to_i
	when 1 then 1
	when 3 then 3
	else 5
	end
	
	profession_code = (if group[:Unspsc_spec].to_s.strip.empty? then
		group[:Unspsc_napr]
	else
		group[:Unspsc_spec]
	end).to_s.strip 
	s['profession_code'] = profession_code unless profession_code.to_s.empty?
	
	passport = (
		passport[:Pasport_Ser].to_s.gsub(/[ -]/, '') +
		'-' + passport[:Pasport_Nom].to_s.gsub(/[ -]/, '')
	).strip
	s['passport'] = passport unless passport.empty? or passport == '-'
	
	s['group_id'] = get_group_id(group[:Grupa_Name].to_s.strip. \
		gsub(/(ЗИ|ЮР)[0-9]*/, '\1'). \
		gsub(/\$$/, ''). \
		tr('ABCEHKMOPT', 'АВСЕНКМОРТ')
	)
	
	agreement = Document.new(
		if person_infol[:AgreementDate].to_s.strip =~ /^(\d{4})\/(\d{2})\/(\d{2}) / then "#{$1}-#{$2}-#{$3}" else Date.new(Date.today.year, 9, 1) end,
		person_infol[:AgreementNum].to_s.strip.sub(/ от .*$/, '')
	)
	s['agreement'] = agreement unless agreement['num'].empty?
	
	s['paragraph_id'] = 0
	
	find_order(order, s)[:attributes]['students'] << s
	
	message "." if count % 25 == 0
	real_count += 1
}

message "done (#{real_count} real students).\n"
message "Writing orders to database (#{@orders.values.length} total)..."

count = 0
@orders.each_value { |order|

	order[:attributes]['students'].sort! { |a,b|
		"#{@group_names[a['group_id']]} #{a['name']['last']} #{a['name']['first']} #{a['name']['father']}" <=>
		"#{@group_names[b['group_id']]} #{b['name']['last']} #{b['name']['first']} #{b['name']['father']}"
	}
	order[:attributes] = order[:attributes].to_xml
	order[:creator_id] = CREATOR_ID
	
	fields = []; values = []
	order.each_pair { |k,v|
		fields << k
		values << v.quote
	}
	statement = "INSERT INTO `order` (#{fields.join(', ')}) VALUES (#{values.join(', ')})"
	$sql.execute statement
	
	@messages << "Created order #{order[:number]}"
	
	count += 1
	message "." if ( count % 2 == 0 )
}

message " done.\n"

response << "<hr/><b>All OK.</b>
<script language='javascript'><!--
function show_debug()
{
	document.getElementById('debug').style.display = '';
}
--></script>
(<a href='javascript:show_debug();'>Show debug stuff</a>)<hr/>
<blockquote id='debug' style='display: none'>#{@messages.join("<br/>\n")}</blockquote>
</body></html>"


rescue Exception => e

	response << "<hr/><b>Exception</b>: #{e.message} (#{e.class})<br/>" + e.backtrace.join("<br/>\n")
	rollback(@insert_id)
	message "\n\nNo students were added"
	
end
