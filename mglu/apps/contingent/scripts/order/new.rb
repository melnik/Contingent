require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

require 'data/order'
require 'data/classifier'

require 'interface/order/details'

# Stage 1 - selection of order type
if get_values['type_id'].nil? and get_values['new_order_id'].nil? then
	tmpl = template 'order/new'

	(tmpl.place_order_type Classifier::OrderType.new 'type').display_empty = false

	print tmpl.render; raise ScriptQuit
end

# Stage 2 - creation of order object
if ( order_id = get_values['new_order_id'].to_i ) == 0 then
	type = get_values['type_id'].to_i

	# Stage 2a - determine faculty
	faculty_id = u.faculty_id.to_i
	faculty_id = get_values['faculty_id'].to_i if faculty_id <= 0
	if faculty_id == 0
		tmpl = template 'order/new/select_faculty'

		tmpl.type_id = type
		tmpl.place_faculty Classifier::Faculty.new

		print tmpl.render; raise ScriptQuit
	end

	o = Order.create type, faculty_id, u.user_id
else
	o = Order.load order_id

	if u.faculty_id.to_i > 0 and o.faculty_id != u.faculty_id
		raise SecurityError.new('No access to other deparment data')
	end
end

# Stage 3 - check if additional properties required
if not o.full?
	case o.class::TARGET
	when :course # Transition order

		# Stage 3a - get additional properties
		if ( course = get_values['course'].to_i ) == 0 then
			tmpl = template 'order/new/select_course'

			tmpl.order_id = o.oid

			o.search_available { |x|
				tmpl.add_course(x, "#{x} курс", false)
			}

			print tmpl.render; raise ScriptQuit
		end

		# Stage 3b - add entity to order
		o << course
	when :order then # Cancellation order

		# Stage 3a - get additional properties
		if ( order_id = get_values['order_id'].to_i ) == 0 then
			tmpl = template 'order/new/select_order'

			tmpl.order_id   = o.oid
			tmpl.faculty_id = o.faculty_id

			print tmpl.render; raise ScriptQuit
		end

		# Stage 3b - add entity to order
		o << order_id
	end
end

# No additional questions to ask
details = Kernel::const_get("DetailsFor#{o.class}")
details.init_order(o) if details.respond_to? :init_order
response.redirect "item_fs.rb?order_id=#{o.oid}"
