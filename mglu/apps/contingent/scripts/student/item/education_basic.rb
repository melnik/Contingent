require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'

tmpl = template 'student/item/education_basic'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i, %w( education_basic ) ).oid

if post_values['save'] then
	u.require_permissions 'student_edit'
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	s.education_basic['level_id'] = attributes['level_id'].to_i

	s.education_basic['organization'] = {
		'type_id' => attributes['organization_type_id'].to_i,
		'kind_id' => attributes['organization_kind_id'].to_i,
		'name_full' => attributes['organization_name_full'],
		'name_short' => attributes['organization_name_short'],
		'num' => attributes['organization_num'],
		'address' => attributes['address_organization'],
		'okato' => attributes['address_organization_okato']
	}

	s.education_basic['document'] = {
		'type_id' => attributes['document_type_id'].to_i,
		'series' => attributes['document_series'],
		'num' => attributes['document_num'],
		'regnum' => attributes['document_regnum'],
		'date' => attributes['document_date'],
		'country_id' => attributes['document_country_id'].to_i
	}

	s.education_basic['specialization'] = {
		'direction' => attributes['direction'],
		'speciality' => attributes['speciality'],
		'profession' => attributes['profession'],
		'qualification' => attributes['qualification']
	}

	s.education_basic['abiturient_category_id'] = attributes['abiturient_category_id'].to_i

	s.save
end

(level = Classifier::EducationLevel.new('level')).select s.education_basic['level_id']
tmpl.place_level               level

(org_type = Classifier::EducationalOrganizationType.new('organization_type')).select s.education_basic['organization']['type_id']
(org_kind = Classifier::EducationalOrganizationKind.new('organization_kind')).select s.education_basic['organization']['kind_id']
tmpl.organization = s.education_basic['organization']
tmpl.place_organization_type   org_type
tmpl.place_organization_kind   org_kind

(doc_type = Classifier::InitialEducationDocumentType.new('document_type')).select s.education_basic['document']['type_id']
(doc_country = Classifier::Country.new('document_country')).select s.education_basic['document']['country_id']
tmpl.document = s.education_basic['document']
tmpl.place_document_date       'document_date', s.education_basic['document']['date']
tmpl.place_document_type       doc_type
tmpl.place_document_country    doc_country

tmpl.specialization = s.education_basic['specialization']

(abiturient_category = Classifier::AbiturientCategory.new).select s.education_basic['abiturient_category_id']
(abiturient_school   = Classifier::AbiturientSchool.new  ).select s.education_basic['abiturient_school_id']
(abiturient_medal    = Classifier::AbiturientMedal.new   ).select s.education_basic['abiturient_medal_id']
tmpl.place_abiturient_category abiturient_category, false
tmpl.place_abiturient_school   abiturient_school,   false
tmpl.place_abiturient_medal    abiturient_medal,    false

tmpl.cert_marks = s.education_basic['cert_marks'].reject do |key, value| value.empty? end
tmpl.exam_marks = s.education_basic['exam_marks'].reject do |key, value| value.empty? end

print tmpl.render
