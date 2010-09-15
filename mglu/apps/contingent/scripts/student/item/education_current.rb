require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'

tmpl = template 'student/item/education_current'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i, %w( education_current ) ).oid

if post_values['save'] then
	u.require_permissions 'student_edit'
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end
	
	s.study_form_id = attributes['study_form_id'].to_i
	s.education_current['program_kind_id'] = attributes['program_kind_id'].to_i

	s.education_current['post_university'] = {
		'science_branch' => {
			'name' => attributes['science_branch_name'],
			'code' => attributes['science_branch_code']
		},
		'speciality' => {
			'name' => attributes['post_speciality_name'],
			'code' => attributes['post_speciality_code']
		}
	}

	s.education_current['expelation'] = {
		'year' => attributes['expelation_year'],
		'reason' => attributes['expelation_reason'],
		'order' => {
			'date' => attributes['expelation_order_date'],
			'num' => attributes['expelation_order_num']
		}
	}

	s.save
end

tmpl.state      = s.state
tmpl.study_type = s.study_type
tmpl.enrollment = s.enrollment
tmpl.department = if s.group_id then
	s.department
else
    s.dup.recondition(s.quit_order.date_activated).department
end

(study_form   = Classifier::StudyForm.new  ).select s.study_form_id;
(program_kind = Classifier::ProgramKind.new).select s.education_current['program_kind_id'];
(profession   = Classifier::Profession.new ).select s.profession_code;
(degree       = Classifier::Degree.new     ).select s.degree_code;

tmpl.profession_title = if s.profession_code =~ /^....00/ then
	'Направление подготовки'
else
	'Специальность'
end

tmpl.place_study_form   study_form
tmpl.place_program_kind program_kind
tmpl.place_profession   profession, false
tmpl.place_degree       degree,     false

tmpl.specialization  = s.specialization_code
tmpl.post_university = s.education_current['post_university']
tmpl.expelation      = s.education_current['expelation']
tmpl.place_expelation_order_date 'expelation_order_date', s.education_current['expelation']['order']['date']

print tmpl.render

