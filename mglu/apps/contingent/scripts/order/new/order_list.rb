require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

require 'data/classifier'

# TODO: this must look more accurate in future
criteria = {}; for key, value in get_values do
	case key.to_s # BlackFix
	when 'new_order_id' then
	else
		criteria[key.to_s] = value
	end
end
# TODO: this must not be separated from get_values
for key, value in post_values do
	case key.to_s # BlackFix
	when /_date_/ then
	when /_date$/ then
		criteria["#{key}_activated"] = value
	else
		criteria[key.to_s] = value
	end
end

# TODO: где-то тут должен OrderOrder#search_available вызываться, по-хорошему

unless criteria.empty? then
	criteria['faculty']         = u.faculty if u.faculty_id
	criteria['order_status_id'] = Classifier::OrderStatus::ACTIVATED
end

print template('widgets/list/order', criteria.compact, "../new.rb?new_order_id=#{get_values['new_order_id']}", 'main').render
