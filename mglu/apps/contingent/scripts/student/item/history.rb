require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/classifier'

tmpl = template 'widgets/list/order', {
	'student_id'      => get_values['student_id'].to_i,
	'order_status_id' => Classifier::OrderStatus::ACTIVATED,
}, '/order/item_fs.rb', '_blank'

tmpl.color_scheme    = :light
tmpl.show_statistics = false

print tmpl.render
