
t = template'order/new/header'

t.order_id = (get_values['order_id'] || post_values['order_id']).to_i

print t.render
