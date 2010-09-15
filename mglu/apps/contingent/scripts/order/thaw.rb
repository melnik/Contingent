require 'auth'

( u = auth_user_current ).require_permissions('order_activate')

require 'data/order'
require 'data/group'

(o = Order.load(get_values['order_id'].to_i) ).thaw

response.redirect "item_fs.rb?order_id=#{o.oid}"