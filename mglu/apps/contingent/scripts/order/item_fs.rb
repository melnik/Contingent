require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

require 'data/order'
require 'data/classifier'

tmpl = template 'order/item_fs'

tmpl.order_id = ( o = Order.load(get_values['order_id'].to_i) ).oid

# View print version only if already activated
if o.status == Classifier::OrderStatus::PROJECT then
	tmpl.faculty_id    = o.faculty_id
	tmpl.target        = if o.class::TARGET == :applicant then 'applicant' else 'student' end
	tmpl.tree_required = o.class::TARGET.in? [ :student, :applicant ]
	tmpl.list_required = o.respond_to? :each_student

	print tmpl.render
elsif o.status.in? [ Classifier::OrderStatus::FROZEN, Classifier::OrderStatus::ACTIVATING ] and u.has_permissions('order_activate') then
	response.redirect "check.rb?order_id=#{o.oid}&action=activate"
else
	response.redirect "print_version.rb?order_id=#{o.oid}"
end
