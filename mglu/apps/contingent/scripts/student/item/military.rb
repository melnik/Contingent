require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'

tmpl = template 'student/item/military'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i, %w( military ) ).oid

if post_values['save'] then
	u.require_permissions 'student_edit'
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	s.military['reserve_category'] = attributes['reserve_category']
	s.military['rank'] = attributes['rank']
	s.military['profile'] = attributes['profile']
	s.military['speciality'] = attributes['speciality']

	s.military['fitness'] = {
		'name' => attributes['fitness_name'],
		'code' => attributes['fitness_code']
	}

	s.military['registration'] = {
		'document' => attributes['registration_document'],
		'general' => attributes['registration_general'],
		'special' => attributes['registration_special'],

		'takeoff' => {
			'date' => attributes['takeoff_date'],
			'reason' => attributes['takeoff_reason']
		},

		'certificate26' => []
	}

	for year in 1..7
		s.military['registration']['certificate26'] << attributes["certificate26_#{year}"]
	end

	s.save
end

##
# Look for military enrollment order
Order.list({
	'student_id'    => s.oid,
	'order_type_id' => MilitaryEnrollmentOrder.type_id,
}, %w( order_id attributes )) do |order_id, attributes|
	tmpl.speciality = attributes['military_speciality'] or s.military['speciality'] # FIXME: remove legacy support

	tmpl.enrollment = Order.load order_id; break # last only
end

##
# Look for military expelation order
Order.list({
	'student_id'    => s.oid,
	'order_type_id' => MilitaryExpelationOrder.type_id,
}, %w( order_id attributes )) do |order_id, attributes|
	tmpl.expelation = Order.load order_id; break # last only
end

tmpl.reserve_category = s.military['reserve_category']
tmpl.rank = s.military['rank']
tmpl.profile = s.military['profile']
tmpl.fitness = s.military['fitness']
tmpl.registration = s.military['registration']

tmpl.place_takeoff_date 'takeoff_date', s.military['registration']['takeoff']['date']

for year in 1..7
	tmpl.add_certificate26_year year, template('/widgets/date', "certificate26_#{year}", s.military['registration']['certificate26'][year-1]).render
end

print tmpl.render
