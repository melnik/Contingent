require 'auth'
auth_user_current.require_permissions('order_project')

require 'data/order.rb'
require 'extensions.rb'
require 'interface/order/details'

o = Order.load post_values['order_id'].to_i

if list = post_values['s'] then
	if list.class != Array then
		list = [list]
	end

	list.collect! do |x| x.to_i end
	details = Kernel::const_get("DetailsFor#{o.class}")

	case para = post_values['destination']
	when 'add' then
		o.method(o.respond_to?(:add_students) ? :add_students : :add).call list
		list.each { |eid|
			# Why the following line was commented out? -- av
			details.init_student(o, eid, 0) if details.respond_to?(:init_student)
		}
	when 'remove' then
		o.method(o.respond_to?(:remove_students) ? :remove_students : :remove).call list
	else
		o.move list, para.to_i
		list.each { |eid|
			details.init_student(o, eid, para.to_i) if details.respond_to?(:init_student)
		}
	end
end

response.redirect "students.rb?order_id=#{o.oid}&paragraph_id=#{post_values['source']}#{"&switch_to=#{para.to_i}" unless para == 'remove'}#{"&refresh=list" if para == 'remove' && o.class.superclass == CourseOrder}"
