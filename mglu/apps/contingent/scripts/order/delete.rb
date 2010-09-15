require 'auth'

auth_user_current.require_permissions 'order_project'

require 'data/order'

Order.delete get_values['order_id'].to_i

response.redirect 'index.rb'
