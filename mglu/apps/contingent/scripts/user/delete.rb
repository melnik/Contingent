require 'auth'

auth_user_current.require_permissions 'user_edit'

require 'data/user'

User.disable get_values['user_id'].to_i

response.redirect 'index.rb'
