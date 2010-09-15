require 'auth'

auth_user_current.require_permissions 'order_project'

require 'data/order'
require 'interface/order/details'

tmpl = template 'order/new_student'

tmpl.order_id = ( o = Order.load get_values['order_id'].to_i ).oid

if post_values['add'] then
	if tmpl.to_add = (Student.list( params = {
		'last_name'   => post_values['last_name'],
		'first_name'  => post_values['first_name'],
		'father_name' => post_values['father_name'],
	} )[:total] == 0 or post_values['force'].enabled?) then
		o.add({
			'name' => {
				'last'   => post_values['last_name'],
				'first'  => post_values['first_name'],
				'father' => post_values['father_name'],
			}
		})
		
		# <hack>
		#
		# To remove this hack I need VirtualStudentsOrder#add to return student_id,
		# which is valid for subsequent #(get|set)_student_attributes calls
		
		o.each_student(:all, %w( student_id last_name first_name father_name )) { |student_id, last_name, first_name, father_name|
			if last_name == post_values['last_name'] and first_name == post_values['first_name'] and father_name == post_values['father_name']
				details = Kernel::const_get("DetailsFor#{o.class}")
				details.init_student(o, student_id, 0)
				o.save
				break
			end
		}
		
		# </hack>
	else
		for key, value in params do
			tmpl[key] = value
		end
	end
end

print tmpl.render
