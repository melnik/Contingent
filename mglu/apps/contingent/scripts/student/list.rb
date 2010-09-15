require 'auth'

( u = auth_user_current ).require_permissions 'student_view_short'

require 'data/student'

tmpl = template 'student/list'
tmpl.has_details = u.has_permissions('student_view')

# TODO: this must look more accurate in future
criteria = {}; for key, value in get_values do
	case key.to_s # BlackFix
	when 'target' then
		case value
		when 'msword' then
			response.header['Content-Type']        = 'application/msword'
			response.header['Content-Disposition'] = 'inline; filename=студенты.doc'
		end
	when 'show_details'
		tmpl.has_details &&= ! get_values['show_details'].disabled?
	else
		criteria[key.to_s] = value
	end
end
# TODO: this must not be separated from get_values
for key, value in post_values do
	criteria[key.to_s] = value
end

add_row = tmpl.method(tmpl.has_details ? :add_row : :add_row_wo_link)

if u.faculty_id and not criteria.empty? then
	if !u.faculty_category.empty? then
		criteria['category'] = u.faculty_category
	elsif u.faculty_id == -2
		criteria['military_year'] = [1,2,3]
	else
		criteria['faculty_id'] = u.faculty_id
	end
end

tmpl.criteria = criteria

if u.has_permissions('student_view') then
	stats = Student.list criteria, %w( student_id name group card_number category study_type_id student_state_id dormitory scholarship military_id degree_code profession_code special_enrollment_code) do |student_id, name, group, card_number, category, study_type_id, student_state_id, dormitory, scholarship, military_id, degree_code, profession_code, special_enrollment_code|
		add_row.call student_id, name, group, card_number, {
			:foreign     => category[:foreign],
			:disabled    => category[:disabled],
			:military    => Classifier::Military[military_id],
			:contract    => study_type_id == Classifier::StudyType::CONTRACT,
			:vacation    => student_state_id == Classifier::StudentState::VACATION,
			:trainee     => student_state_id == Classifier::StudentState::TRAINEE,
			:expelled    => student_state_id == Classifier::StudentState::EXPELLED,
			:dormitory   => dormitory,
			:scholarship => scholarship,
			:degree_code => degree_code,
			:profession_code => profession_code,
		} # GREYFIX: change to sane constants
	end
else
	criteria.delete_if do |key, value|
		not key.in? %w( faculty course department_num group name gender_id card_number student_state )
	end

	stats = Student.list criteria, %w( student_id name group card_number ) do |student_id, name, group, card_number|
		add_row.call student_id, name, group, card_number, {}
	end

	stats.delete_if do |key, value|
		not key.in? [ :total, 'Пол' ]
	end if stats
end

if stats then
	for title, stat in stats.sort_by{|k,v| k.to_s.size } do
		case title
		when :total then
			tmpl.total = stat
		else
			tmpl.add_stats title, nil

			for category, count in stat.sort_by{|k,v| v }.reverse do
				tmpl.add_stats category, count
			end
		end
	end
else
	tmpl.total = '0 (поиск не производился)'
end

print tmpl.render
