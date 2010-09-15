require 'auth'

auth_user_current.require_permissions 'news_edit'

require 'data/news'

News.delete get_values['news_id'].to_i

response.redirect 'index.rb'
