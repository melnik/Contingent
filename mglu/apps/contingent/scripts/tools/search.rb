require 'auth'

require 'data/classifier'

tmpl = template "tools/search_#{target = get_values['target']}"

case target
when 'student' then
	tmpl.restricted = !auth_user_current.has_permissions('student_edit')

	(tmpl.place_gender              Classifier::Gender.new            ).wide = true
	(tmpl.place_student_state       Classifier::StudentState.new      ).wide = true
	(tmpl.place_student_status      Classifier::StudentStatus.new     ).wide = true
	(tmpl.place_study_type          Classifier::StudyType.new         ).wide = true
	(tmpl.place_study_form          Classifier::StudyForm.new         ).wide = true
	(tmpl.place_degree              Classifier::Degree.new            ).wide = true
when 'applicant' then
	(tmpl.place_gender              Classifier::Gender.new            ).wide = true
when 'order' then
	tmpl.add_min_date 'min_date', Date.today - 365 / 2
	tmpl.add_max_date 'max_date', Date.today

	(tmpl.place_order_type Classifier::OrderTypeShort.new).wide = true

	case get_values['return_url']
	when /^\/order\/new\// then
		( order_status = Classifier::OrderStatus.new ).select Classifier::OrderStatus::ACTIVATED

		tmpl.place_order_status order_status, false
	else
		(tmpl.place_order_status Classifier::OrderStatus.new).wide = true
	end
when 'user' then
	(tmpl.place_role Classifier::Role.new).wide = true
end

tmpl.faculty_id = get_values['faculty_id']
tmpl.return_url = get_values['return_url']

print tmpl.render
