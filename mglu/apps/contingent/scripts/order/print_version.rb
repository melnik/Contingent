require 'auth'
#auth_user_current.require_permissions('order_project')

require 'data/order'

# TODO: find a better place for them
require 'document'
require 'daterange'

require 'interface/order/details'

oid = get_values['order_id'].to_i
part = get_values['part']
o = Order.load(oid)

print(if o.number == ' [generated] ' then
	template('order/generated').render
elsif part == 'all' then
	o.html_part(:all, auth_user_current.user_id)
elsif part.to_i > 0 then
	o.html_part(part.to_i, auth_user_current.user_id)
else
	o.html
end)
