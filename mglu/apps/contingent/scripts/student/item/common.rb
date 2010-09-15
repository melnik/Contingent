require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'
require 'data/classifier'

tmpl = template 'student/item/common'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i, %w( common ) ).oid

if post_values['save'] then
	u.require_permissions 'student_edit'
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	s.birth_date = attributes['birth_date'].to_d

	s.common['birth_place'] = {
		'country_id' => attributes['birth_country_id'].to_i,
		# TODO: add region_id checks
		'region_id'  => attributes['birth_region_id'].to_i,
	} unless attributes['birth_country_id'].empty?

	s.common['documents'] = {
		'identity_document' => attributes['identity_document_type_id'].empty? ? nil : {
			'type_id' => attributes['identity_document_type_id'].to_i,
			'serial'  => attributes['identity_document_serial'],
			'number'  => attributes['identity_document_number'],
			'issuer'  => attributes['identity_document_issuer'],
			'date'    => attributes['identity_document_date'].to_d,
		},

		'taxpayer_identity' => attributes['taxpayer_identity'],

		'social_security' => {
			'number' => attributes['social_security_number'],
		},

		'health_insurance' => {
			'serial'  => attributes['health_insurance_serial'],
			'number'  => attributes['health_insurance_number'],
			'company' => attributes['health_insurance_company'],
		},
	}

	s.common['contacts'] = {
		'addresses' => {
			'stationary' => attributes['address_stationary'].empty? ? nil : {
				'string' => attributes['address_stationary'],
				'okato'  => attributes['address_stationary_okato'],
			},

			'temporary' => attributes['address_temporary'].empty? ? nil : {
				'string'  => attributes['address_temporary'],
				'okato'   => attributes['address_temporary_okato'],
				'expires' => attributes['address_temporary_expires'].to_d,
			},
		},

		'phones' => {
			'home' => attributes['phone_home'],
			'cell' => attributes['phone_cell'],
		},
	}
	
	s.dormitory = (not attributes['dormitory'].nil?)

	s.save
end

tmpl.state = s.state

( gender = Classifier::Gender.new ).select s.gender_id

tmpl.place_gender gender, false
tmpl.gender = s.gender_id

( birth_country = Classifier::Country.new 'birth_country' ).select s.common['birth_place']['country_id']
( birth_region  = Classifier::Region.new  'birth_region'  ).select s.common['birth_place']['region_id']
( citizenship   = Classifier::Citizenship.new             ).select s.citizenship_id

tmpl.place_birth_date    'birth_date', s.birth_date
(tmpl.place_birth_country birth_country).on_change = 'checkCountry();'
tmpl.place_birth_region   birth_region
tmpl.place_citizenship    citizenship, false

tmpl.documents = s.common['documents']

( identity_document_type = Classifier::IdentityDocumentType.new ).select s.common['documents']['identity_document']['type_id']

tmpl.place_identity_document_type identity_document_type
tmpl.place_identity_document_date 'identity_document_date', s.common['documents']['identity_document']['date']

tmpl.contacts = s.common['contacts']

tmpl.place_address_temporary_expires 'address_temporary_expires', s.common['contacts']['addresses']['temporary']['expires']

tmpl.dormitory = s.dormitory

# Handle acccesing via ssh tunnel
tmpl.photo_url = "/photo/#{tmpl.student_id.to_s[-2..-1]}/#{tmpl.student_id}.jpg"
print tmpl.render
