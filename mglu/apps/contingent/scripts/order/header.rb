require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

require 'data/order'
require 'data/classifier'

tmpl = template 'order/header'

tmpl.order = ( o = Order.load(get_values['order_id'].to_i) )

if post_values['save'] then
	o.number = post_values['number']

	o.save
end

tmpl.activable = u.has_permissions 'order_activate'

print tmpl.render
