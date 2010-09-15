require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'

tmpl = template 'student/item/education_result'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i, %w( education ) ).oid

if post_values['save'] then
	u.require_permissions 'student_edit'
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	# TODO: add attributes parsing.

	s.save
end

profession    = Classifier::Profession.new
level         = Classifier::EducationLevel.new
document_type = Classifier::FinalEducationDocumentType.new

case s.quit_order
when ExpelationOrder then
	tmpl.expelation = s.quit_order
when GraduationOrder then
	tmpl.graduation = s.quit_order

	level.select         5 # FIXME: высшее профессиональное
	document_type.select 2 # FIXME: диплом о высшем профессиональном образовании
	profession.select    s.profession_code
end

tmpl.profession_title = if s.profession_code =~ /^....00/ then
	'Направление подготовки'
else
	'Специальность'
end

tmpl.place_profession              profession   , false
tmpl.place_education_level         level        , false
tmpl.place_education_document_type document_type, false

tmpl.place_education_document_date 'education_document_date', nil

print tmpl.render
