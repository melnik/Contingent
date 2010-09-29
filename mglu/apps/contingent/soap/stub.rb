require 'extensions'
require 'time'

$KCODE = 'UTF8'

require 'rexml/document'

class StudentsSrvPort
	def execute(request_text)
		doc = REXML::Document.new(request_text)
		reqxml = doc.root.elements[1].elements[1]

		p "Operation: #{reqxml.name}"
		p 'Namespaces:'
		p doc.root.namespaces

		response = case reqxml.name
		when 'getRequest'
			get(reqxml)
		when 'listStudentsRequest'
			listStudents(reqxml)
		when 'listOrdersRequest'
			listOrders(reqxml)
		when 'listClassifierRequest'
			listClassifier(reqxml)
		else
			raise 'Unsupported method'
		end

		doc.root.add_namespace('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance')
		doc.root.add_namespace('xmlns:ns1', 'http://contingent.bmstu.ru/')

#		@ns_cont = @ns_xsi = nil
		
#		doc.root.attributes.each { |abbr, full|
#			@ns_cont = abbr if full == 'http://contingent.bmstu.ru/'
#			@ns_xsi = abbr if full == 'http://www.w3.org/2001/XMLSchema-instance'
#			p abbr, full
#		}

#		doc.root.add_namespace(''

		resxml = doc.root.elements[1].elements[1]
		doc.root.elements[1].elements[1].name = resxml.name.gsub(/Request/, 'Response')
		resxml.elements.delete_all('*')
		resxml.attributes['xsi:type'] = 'ns1:' + resxml.name
		if response.is_a?(Array) then
			p "Adding array"
			response.each { |i| resxml.add(i) }
		else
			p "Adding non-array"
			p response
			resxml.add(response)
		end

		response_text = ''
		doc.write(response_text, 0)
		p "Sending response:"
		p response_text
		return response_text
	end

	def version
		return 'Contingent Web Service v2.0'
	end

	def get(req)
		p req
		p req.to_s
		p req.elements['*:id'].to_s
		if req.elements['*:id']
			parsed_id = req.elements['*:id'].text.to_id
		else
			raise 'Object ID not found'
		end
		p parsed_id

		obj = REXML::Element.new('object')

		case parsed_id[:entity]
		when :student
			s = Student.load(parsed_id[:id])

			p "student = " + s.inspect

			obj.attributes['xsi:type'] = 'ns1:Student'

			obj.add_element('id').text = s.oid.to_i.to_uuid(:student)
			obj.add_element('name').text = s.last_name.utf_encode + ' ' + s.first_name.utf_encode + ' ' + s.father_name.utf_encode
			obj.add_element('lastName').text = s.last_name.utf_encode
			obj.add_element('firstName').text = s.first_name.utf_encode
			obj.add_element('middleName').text = s.father_name.utf_encode

			add_classifier(
				obj,
				'gender',
				s.gender_id.to_uuid('gender'),
				s.gender.utf_encode
			) if s.gender_id and s.gender

			obj.add_element('birthDate').text = s.birth_date if s.birth_date

#				false, # GREYFIX: s.group.monitor_id == s.oid,
#				liabilities ? 1 : 0, # GREYFIX: return quantity?
			obj.add_element('cardNumber').text = s.card_number.utf_encode
			add_classifier(
				obj,
				'studyType',
				s.study_type_id.to_uuid('study_type'),
				s.study_type.utf_encode
			) if s.study_type
			add_classifier(
				obj,
				'studentState',
				s.state_id.to_uuid('student_state'),
				s.state.utf_encode
			) if s.state
			obj.add_element('dormitory').text = s.dormitory.to_s

			if s.group.oid
				grp = obj.add_element('group')
				export_group(s.group, grp)
			end

			add_profession_classifier(
				obj,
				'profession',
				nil,
				s.profession_code.utf_encode,
				s.profession.utf_encode,
				s.specialization_code.utf_encode,
				'',
				s.degree_code.utf_encode,
				s.degree.utf_encode
			)
			obj.add_element('disabled').text = s.category[:disabled].to_s
			obj.add_element('foreign').text = s.category[:foreign].to_s
			obj.add_element('photo').text = "http://contingent.bmstu.ru/photo/#{s.oid.to_s[-2..-1]}/#{s.oid}.jpg"

		when :order
			o = Order.load(parsed_id[:id])

			obj.attributes['xsi:type'] = 'ns1:ContingentOrder'

			# Collect basic order fields
			obj.add_element('id').text = o.oid.to_i.to_uuid(:order)
			obj.add_element('name').text = o.number.utf_encode

			# Add order type
			add_classifier(
				obj,
				'type',
				o.class.type_id.to_uuid('order_type'),
				o.class.type_name.utf_encode
			)

			obj.add_element('dateCreated').text = o.date_created.to_s
			obj.add_element('dateActivated').text = o.date_activated.to_s
#			obj.add_element('html').text = o.html.utf_encode

			# Add students from the order
			o.each_student(:all, %w( student_id last_name first_name father_name group_id group attributes )) { |student_id, last_name, first_name, father_name, group_id, group, attributes|
				s = obj.add_element('student')
				s.attributes['xsi:type'] = 'ns1:StudentInOrder'
				s.add_element('id').text = student_id.to_uuid(:student)
				s.add_element('name').text = [first_name.utf_encode, father_name.utf_encode, last_name.utf_encode].join(' ')
				s.add_element('attributes').text = preprocess(attributes)
				if group_id then
					grp = s.add_element('group')
					grp.attributes['xsi:type'] = 'ns1:Group'
					grp.add_element('id').text = group_id.to_uuid(:group)
					grp.add_element('name').text = group.utf_encode
				end
			}

			# GREYFIX: todo - add groups

			# Add order specific XML attributes
			obj.add_element('attributes').text = preprocess(o.attributes)
		when :group
			g = Group.load(parsed_id[:id])
			export_group(g, obj)

		when :department
			d = Department.load(parsed_id[:id])
			export_department(d, obj)
		when :faculty
			f = Faculty.load(parsed_id[:id])

			obj.attributes['xsi:type'] = 'ns1:Faculty'

			obj.add_element('id').text = f.oid.to_uuid(:faculty)
			obj.add_element('name').text = f.name.utf_encode
			obj.add_element('fullName').text = f.full_name.utf_encode
		else
			if parsed_id.nil?
				raise 'Unknown entity'
			else
				raise 'Not implemented'
			end
		end

		return obj
	end

	def listOrders(req)
		result = []

		# Build search criteria from request
		criteria = {
			'order_status_id' => Classifier::OrderStatus::ACTIVATED
		}
		req.each { |e|
			next if e.text.empty?
			case e.name
			when 'type'
				parsed_id = e.text.to_id
				raise 'Wrong order type' if parsed_id[:entity] != 'order_type'
				criteria['order_type_id'] = parsed_id[:id]
			when 'dateStart'
				criteria['min_date_activated'] = e.text
			when 'dateEnd'
				criteria['max_date_activated'] = e.text
			when 'faculty'
				parsed_id = e.text.to_id
				p "Parsed faculty as #{parsed_id[:entity].inspect}"
				if parsed_id[:entity] == :faculty
					criteria['faculty_id'] = parsed_id[:id]
				else
					criteria['faculty'] = e.text.utf_decode
				end
			when 'student'
				parsed_id = e.text.to_id
				p "Parsed student as #{parsed_id[:entity].inspect}"
				if parsed_id[:entity] == :student
					criteria['student_id'] = parsed_id[:id]
				else
					criteria['name'] = e.text.utf_decode
				end
			when 'timestampStart'
				criteria['min___updated__'] = Time.parse(e.text)
			when 'timestampEnd'
				criteria['max___updated__'] = Time.parse(e.text)
			else
				p "Wrong criteria name: #{e.name}"			
			end
		}

		p "Starting orders search. Criteria: " + criteria.inspect

		Order.list(criteria, [ 'order_id', 'order_type_id', 'order_type', 'number', 'date_created', 'date_activated' ]) { |oid, order_type_id, order_type, number, date_created, date_activated|
			obj = REXML::Element.new('order')
			obj.add_element('id').text = oid.to_i.to_uuid(:order)

			# Add order type
			add_classifier(
				obj,
				'type',
				order_type_id.to_uuid('order_type'),
				order_type.utf_encode
			)

			obj.add_element('name').text = number.utf_encode
			obj.add_element('dateCreated').text = date_created.to_s
			obj.add_element('dateActivated').text = date_activated.to_s			
			result << obj
		}
		return result
	end

	ALLOWED_CLASSIFIERS = %w(
		Gender OrderType StudentState
	)

	def listClassifier(req)
		cname = req.elements['*:name'].text

		# Check if we support this classifier
		raise 'Classifier not found' if ALLOWED_CLASSIFIERS.grep(cname).empty?

		# Create a classifier object using name given
		cl = (Classifier::const_get(cname)).new

		# Iterate over all classifier contents and output them all
		result = []
		cl.each { |ent|
			result << add_classifier(
				nil,
				'classifier',
				ent[:id].to_uuid(cl.name),
				ent[:name].utf_encode,
				ent[:code] ? ent[:code].utf_encode : nil
			)
		}
		return result
	end

	def listOrderTypes(listOrderTypes)
		arr = []
		Classifier::OrderType.new.each { |ent|
			arr << ContingentSOAP::OrderType.new(ent[:id], ent[:name].utf_encode)
		}
		return [ContingentSOAP::ArrayOfOrderTypes.new(arr)]
	end

	CRITERIA_MAPPING = {
		'lastName' => 'last_name',
		'firstName' => 'first_name',
		'middleName' => 'father_name',
		'faculty' => 'faculty',
		'department' => 'department',
		'group' => 'group',
		'dormitory' => 'dormitory',
		'gender' => 'gender',
		'cardNumber' => 'card_number',
		'studentState' => 'student_state',
		'timestampStart' => 'min_last_update',
		'timestampEnd' => 'max_last_update',
	}
	
	CRITERIA_MAPPING_UUID = {
		'studentState' => 'student_state_id',
		'gender' => 'gender_id',
	}

	def listStudents(req)
		criteria = {}
		req.elements.each { |e|
			p e.name
			if CRITERIA_MAPPING[e.name]
				if not e.text.empty?
					parsed_id = e.text.to_id
					if parsed_id
						if parsed_id[:entity] == CRITERIA_MAPPING[e.name]
							p "processing #{e.name} as UUID"
							criteria[CRITERIA_MAPPING_UUID[e.name]] = parsed_id[:id]
						else
							p "processing #{e.name} as string, UUID entity mismatch"
							criteria[CRITERIA_MAPPING[e.name]] = e.text.utf_decode
						end
					else
						p "processing #{e.name} as string"
						criteria[CRITERIA_MAPPING[e.name]] = e.text.utf_decode
					end
				else
					p "processing #{e.name} - empty, skipping"
				end
			elsif (e.name == 'disabled' or e.name == 'foreign') and (e.text == 'true')
				p "processing #{e.name} as category"
				criteria['category'] = [ e.name ]
			else
				p "processing #{e.name} - not supported, skipping"
			end
		}
		criteria['min_last_update'] = Time.parse(criteria['min_last_update']) if criteria['min_last_update']
		criteria['max_last_update'] = Time.parse(criteria['max_last_update']) if criteria['max_last_update']
		p criteria
		raise "Would not list all students - criteria needed" if criteria.empty?
		return get_students_by_criteria(criteria)
	end

	def listByFaculty(listByFaculty)
		return ContingentSOAP::ListByFacultyReturn.new(
			get_students_by_criteria({ 'faculty' => listByFaculty.faculty.utf_decode })
		)
	end

	def listByDepartment(listByDepartment)
		return ContingentSOAP::ListByDepartmentReturn.new(
			get_students_by_criteria({ 'department' => listByDepartment.department.utf_decode })
		)
	end

	def listByGroup(listByGroup)
		return ContingentSOAP::ListByGroupReturn.new(
			get_students_by_criteria({ 'group' => listByGroup.group.utf_decode })
		)
	end
	
	private
	def get_students_by_criteria(criteria)
		arr = []
		$KCODE = 'NONE'
		Student.list(
			criteria,
			%w(student_id first_name father_name last_name faculty department group group_id dormitory gender_id gender study_type_id study_type liabilities card_number student_state_id student_state category profession profession_code specialization specialization_code degree degree_code)
		) { |student_id, first_name, father_name, last_name, faculty, department, group, group_id, dormitory, gender_id, gender, study_type_id, study_type, liabilities, card_number, student_state_id, student_state, category, profession, profession_code, specialization, specialization_code, degree, degree_code|

			obj = REXML::Element.new('student')
			obj.attributes['xsi:type'] = 'ns1:Student'

			obj.add_element('id').text = student_id.to_i.to_uuid(:student)
			obj.add_element('name').text = last_name.utf_encode + ' ' + first_name.utf_encode + ' ' + father_name.utf_encode
			obj.add_element('firstName').text = first_name.utf_encode
			obj.add_element('middleName').text = father_name.utf_encode
			obj.add_element('lastName').text = last_name.utf_encode
			add_classifier(
				obj,
				'gender',
				gender_id.to_uuid('gender'),
				gender.utf_encode
			) if gender_id

#				false, # GREYFIX: s.group.monitor_id == s.oid,
#				liabilities ? 1 : 0, # GREYFIX: return quantity?
			obj.add_element('cardNumber').text = card_number.utf_encode
			add_classifier(
				obj,
				'studyType',
				study_type_id.to_uuid('study_type'),
				study_type.utf_encode
			) if study_type_id
			add_classifier(
				obj,
				'studentState',
				student_state_id.to_uuid('student_state'),
				student_state.utf_encode
			) if student_state_id

			obj.add_element('dormitory').text = dormitory.to_s

			if group_id then
				grp = obj.add_element('group')
				grp.attributes['xsi:type'] = 'ns1:Group'
				grp.add_element('id').text = group_id.to_uuid(:group)
				grp.add_element('name').text = group.utf_encode
			end

			add_profession_classifier(
				obj,
				'profession',
				nil,
				profession_code.utf_encode,
				nil, # profession.utf_encode,
				specialization_code.utf_encode,
				nil, # specialization,
				degree_code.utf_encode,
				nil # degree.utf_encode
			)
#			s.profession_code.utf_encode

			obj.add_element('disabled').text = category[:disabled].to_s
			obj.add_element('foreign').text = category[:foreign].to_s

#			p obj
			arr << obj
		}
		$KCODE = 'UTF-8'
		return arr
	end

	def reportGraduated(reportGraduatedRequest)
		p 'reportGraduated'
		p reportGraduatedRequest

		year = reportGraduatedRequest.year.to_i
		dept = reportGraduatedRequest.department.utf_decode

		$KCODE = 'NONE'
		faculty = dept.gsub(/\d/, '')

		arr = ContingentSOAP::ArrayOfReportGraduatedPerson.new
		Order.list({
			:faculty => faculty,
			:order_type_id => GraduationOrder.type_id,
			:min_date_activated => Date.new(year, 1, 1),
			:max_date_activated => Date.new(year, 12, 31),
			:order_status_id => Classifier::OrderStatus::ACTIVATED,
		}, ['order_id']) { |oid|
			o = Order.load(oid)
			o.each_student(:all,
				%w(student_id first_name father_name last_name department attributes profession profession_code)
			) { |student_id, first_name, father_name, last_name, department, attr, profession, profession_code|
				next unless department == dept
				s = ContingentSOAP::ReportGraduatedPerson.new
				s.id = student_id.to_i.to_uuid(:student)
				s.firstName = first_name.utf_encode if first_name
				s.fatherName = father_name.utf_encode if father_name
				s.lastName = last_name.utf_encode if last_name
				s.profession = profession.utf_encode if profession
				s.professionCode = profession_code.utf_encode if profession_code
				s.qualification = attr['qualification'].utf_encode if attr['qualification']
				s.qualificationCode = 65
				# case attr['qualification']
#				when /Бакалавр/ then 62
#				when /Инженер/ then 65
#				when /Магистр/ then 68					
#				end
				s.diplomaType = attr['diploma_type']
				if attr['protocol']
					s.protocolDate = attr['protocol'].date
					s.protocolNumber = attr['protocol'].num.utf_encode if attr['protocol'].num
				end
				s.orderNumber = o.number.utf_encode if o.number
				arr << s
			}
		}
		$KCODE = 'UTF-8'
		arr.sort! { |a, b| a.lastName <=> b.lastName }

		p arr
		return ContingentSOAP::ArrayOfReportGraduatedPerson.new([arr])
	end

	def preprocess(xml)
		res = xml.to_xml

		# Remove all type information
		res.gsub!(/ class="(.*?)"/, '')

		# Process known classifiers to UUIDs
		res.gsub!(/<student_state_id>(.*?)<\/student_state_id>/) {
			'<studentState>' + $1.to_i.to_uuid('student_state') + '</studentState>'
		}
		res.gsub!(/<group_id>(.*?)<\/group_id>/) {
			'<group>' + $1.to_i.to_uuid(:group) + '</group>'
		}
		res.gsub!(/<order_id>(.*?)<\/order_id>/) {
			'<order>' + $1.to_i.to_uuid(:order) + '</order>'
		}
		res.gsub!(/<current_study_type_id>(.*?)<\/current_study_type_id>/) {
			'<currentStudyType>' + $1.to_i.to_uuid('study_type') + '</currentStudyType>'
		}
		res.gsub!(/<study_type_id>(.*?)<\/study_type_id>/) {
			'<studyType>' + $1.to_i.to_uuid('study_type') + '</studyType>'
		}

		# Convert the rest of identifiers to camelCase
		res.gsub!(/<(.*?)>(.*?)<\/(\1)>/) { |orig|
			content = $2
			tag = $1.gsub(/_(.)/) { $1.upcase }
			"<#{tag}>#{content}</#{tag}>"
		}
		return res.utf_encode
	end

	def add_classifier(obj, type, id, name, code = nil)
		cl = obj ? obj.add_element(type) : REXML::Element.new(type)
		cl.attributes['xsi:type'] = 'ns1:Classifier'
		cl.add_element('id').text = id
		cl.add_element('name').text = name
		cl.add_element('code').text = code if code
		return cl
	end
	
	def add_profession_classifier(obj, type, id, prof_code, prof_name, spec_code, spec_name, qual_code, qual_name)
		cl = obj ? obj.add_element(type) : REXML::Element.new(type)
		cl.attributes['xsi:type'] = 'ns1:ProfessionClassifier'
		cl.add_element('id').text = 'ffffffff-ffff-ffff-ffff-ffffffffffff'
		cl.add_element('professionCode').text = prof_code
		cl.add_element('profession').text = prof_name if prof_name
		cl.add_element('specializationCode').text = (spec_code.to_s == '') ? '00' : spec_code
		cl.add_element('specialization').text = spec_name if spec_name
		cl.add_element('qualificationCode').text = qual_code
		cl.add_element('qualification').text = qual_name if qual_name
		return cl
	end

	def export_group(g, obj)
		obj.attributes['xsi:type'] = 'ns1:Group'

		obj.add_element('id').text = g.oid.to_uuid(:group)
		obj.add_element('name').text = g.name.utf_encode

		dept = obj.add_element('department')
		dept.add_element('id').text = g.department_id.to_i.to_uuid(:department)

		obj.add_element('currentTermNumber').text = g.term_number
		obj.add_element('seqNumber').text = g.number
	end

	def export_department(d, obj)
		obj.attributes['xsi:type'] = 'ns1:Department'
		obj.add_element('id').text = d.oid.to_uuid(:department)
		obj.add_element('name').text = d.name.utf_encode
		obj.add_element('fullName').text = d.full_name.utf_encode
		obj.add_element('number').text = d.number

		dept = obj.add_element('faculty')
		dept.add_element('id').text = d.faculty.oid.to_uuid(:faculty)
	end
end

$KCODE = 'NONE'
