#!/usr/bin/env ruby

Standalone = !$LOAD_PATH.find { |x| x =~ /share$/ }

require 'net/http'
require 'rexml/document'

require '../../context' if Standalone
require 'data/classifier'

unless Standalone then
	response.sendHeaders
	response << "<html><body><b>Processing, please wait...</b><br/>"
	response.flush
end

Date = ::Date

@insert_id = 25 # Update this ID every term

@group_cache = {}
@faculty_cache = {}
@group_names = {}

@messages = []

class Date
	def inspect
		"\"#{to_s}\".to_date"
	end
end

CREATOR_ID = $sql.execute("SELECT user_id FROM user WHERE login = 'enrollment'").fetch_hash['user_id'].to_i

@classifiers = {}
def classifier_lookup(classifier, name)
	hash = @classifiers[classifier]
	unless hash then
		@classifiers[classifier] = hash = {}
		classifier.new.each { |row|
			hash[row[:name]] = row[:id]
		}
	end
	hash[name]
end

def get_group_id(group_name)

    if cached = (@group_cache ||= {})[group_name]
        return cached
    end

    unless group_name =~ /^(\W+)(\d*)-(\d+)-(\d+)$/
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
    message "Created group #{gid} = #{faculty}#{department}-#{term}#{num}"
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

#SERVER = "http://195.19.59.96:8090/exist/rest"
#SERVER = "http://127.0.0.1:8123/exist/rest"
def query(request)
	url = URI.parse(request)
	res = Net::HTTP.start(url.host, url.port) { |http| http.get(url.path) }
	message "GET #{request} => #{res.code.to_i}"
	(res.code.to_i == 200) ? REXML::Document.new(res.body).root : nil
end


def message(msg)
	if Standalone
		$stderr.puts msg
	else
		response << msg.gsub('\t', '&nbsp;&nbsp;&nbsp;&nbsp;') << "<br/>\n"
		response.flush
	end
end

begin

#message "Rolling back previous upload"
#rollback(@insert_id)

date = Date.today - 2

@citizenship_convert = {
	"a115db60-d635-11dc-bb0c-003048351d16" => 1,
	"a115ef92-d635-11dc-84aa-003048351d16" => 2,
	"ec106dca-32a3-11df-8128-003048c6b34e" => 5,
	"f5dd1981-32a3-11df-8128-003048c6b34e" => 7
}

@gender_convert = {
	"d0475c5a-d596-11dc-ae45-003048351d16" => 1,
	"db7cd564-d596-11dc-b2f1-003048351d16" => 2
}

@study_type_convert = {
	"14179986-d597-11dc-85d7-003048351d16" => Classifier::StudyType::BUDGET,
	"18d90e28-d597-11dc-8426-003048351d16" => Classifier::StudyType::CONTRACT
}

urls = if Standalone then STDIN.read else post_values['orders'] end
urls = urls.strip.split(/\s+/)
urls.each { |url|
	xo = query(url)

	message "Processing order #{xo.elements['uuid'].text}"

	study_form = xo.elements["content/body/studyForm/name"]
	
	order_attributes = {
		'student_state_id' => Classifier::StudentState::STUDYING,
		'enrollment_date' => Date.new(Date.today.year, 9, 1),
		'study_type' => nil,
		'degree_code' => nil,
		'category' => '',
		'students' => []
	}
	reason = xo.elements['content/body/reason/reason']
	if reason
		reason_text = reason.text
		order_attributes['resolution'] = Document.new(
			Date.new($3.to_i, $2.to_i, $1.to_i),
			$4
		) if reason_text =~ /На основании решения отборочной комиссии факультета \S* от (\d+)\.(\d+)\.(\d+) протокол №\s*(.*?),/
		order_attributes['approval'] = Document.new(
			Date.new($3.to_i, $2.to_i, $1.to_i),
			$4
		) if reason_text =~ /утвержденного на заседании Приемной комиссии МГТУ им. Н. Э. Баумана от\s+(\d+).(\d+).(\d+) протокол №\s*(.*)$/
	end				
	
	order = {
		:__insert_id => @insert_id,
		:order_type_id => 8,
		:order_status_id => Classifier::OrderStatus::FROZEN,
		:faculty_id => nil, # TODO: restore
		:date_created => xo.elements["created"].text.gsub(/T.*$/, '').to_date,
		:date_activated => xo.elements["content/registration/registered"].text.to_date,
		:number => xo.elements["content/registration/number"].text,
		:creator_id => CREATOR_ID,
		:attributes => order_attributes,
	}

	faculty = nil

	xo.elements["content/body/paragraphs"].each_element("paragraph") { |xs|
		xs = xs.elements["newStudent"]
		message "    #{xs.elements["lastname"].text} #{xs.elements["firstname"].text} #{xs.elements["middlename"].text}"

		#puts xs.to_s

		faculty = xs.elements["group/titleshort"].text.tr('ABCEHKMOPT', 'АВСЕНКМОРТ').gsub(/[0-9\-]*/, '')

		student = {
			'name' => {
				'first'  => xs.elements["firstname"].text,
				'last'   => xs.elements["lastname"].text,
				'father' => xs.elements["middlename"].text
			},
			
			'card_number' => xs.elements["cardNumber"].text,
			
			'gender_id' => @gender_convert[xs.elements["gender/uuid"].text],
			
			'birth_date' => xs.elements["birthDate"].text.gsub(/\+.*$/, '').to_date,
			
			'citizenship_id' => @citizenship_convert[xs.elements["citizenship/uuid"].text],
			
			'profession_code' => xs.elements["speciality/name"].text[0...6],
			
			'specialization_code' => xs.elements["speciality/name"].text[6...8],
			
			'country' => classifier_lookup(Classifier::Country, xs.elements["citizenship/country"].text),
			
			'passport' => (xs.elements["passport/series"].text || '') + ' ' + (xs.elements["passport/number"].text || ''),
			
			'group_id' => get_group_id(xs.elements["group/titleshort"].text. \
				gsub(/(ЗИ|ЮР)[0-9]*/, '\1'). \
				gsub(/\$$/, ''). \
				tr('ABCEHKMOPT', 'АВСЕНКМОРТ')
			),
			
			'paragraph_id' => 0
		}
		
		order[:faculty_id] ||= get_faculty_id(xs.elements["group/titleshort"].text.tr('ABCEHKMOPT', 'АВСЕНКМОРТ').gsub(/[0-9\-]*/, ''))
		
		order[:attributes]['study_type_id'] ||= @study_type_convert[xs.elements["studyType/uuid"].text]
		
		order[:attributes]['degree_code'] ||= xs.elements["speciality/name"].text[8...10]
		
		xs.each_element("agreements") { |agr|
			agrtype = agr.elements["agreementType/uuid"]
			if agrtype && agrtype.text == "3e6b946f-3342-11df-8128-003048c6b34e" then
				student['agreement'] = Document.new(
					agr.elements["date"].text.gsub(/\+.*$/, '').to_date,
					agr.elements["name"].text
				)
				break
			end
		}
		
		order[:attributes]['students'] << student
	}
	
	order[:attributes]['students'].sort! { |a,b|
		"#{@group_names[a['group_id']]} #{a['name']['last']} #{a['name']['first']} #{a['name']['father']}" <=>
		"#{@group_names[b['group_id']]} #{b['name']['last']} #{b['name']['first']} #{b['name']['father']}"
	}
	
	#File.open('data.rb', 'w') { |f| f << "DATA = " << order.inspect << "\n" }
	
	order[:attributes] = order[:attributes].to_xml
	order[:creator_id] = CREATOR_ID
	
	fields = []; values = []
	order.each_pair { |k,v|
		fields << k
		values << v.quote
	}
	statement = "INSERT INTO `order` (#{fields.join(', ')}) VALUES (#{values.join(', ')})"
	$sql.execute statement
	
	message "<b>Created order <a href=\"/order/item_fs.rb?order_id=#{$sql.insert_id}\">#{$sql.insert_id}</a> (#{faculty})</b>"
}
message "=== Done ==="

rescue Exception => e

	message "=== Exception: #{e.message} (#{e.class}) ==="
	e.backtrace.each { |line| message line }
	rollback(@insert_id)
	message "<b>Nothing added</b>"
	
end

unless Standalone then
	response << "</body></html>"
end
