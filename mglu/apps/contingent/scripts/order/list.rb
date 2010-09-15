require 'auth'

( u = auth_user_current ).require_permissions 'order_project'

require 'data/classifier'

# TODO: this must look more accurate in future
criteria = {}; for key, value in get_values do
	criteria[key.to_s] = value
end
# TODO: this must not be separated from get_values
for key, value in post_values do
	case key.to_s # BlackFix
	when 'target' then
		case value
		when 'msword' then
			response.header['Content-Type']        = 'application/msword'
			response.header['Content-Disposition'] = 'inline; filename=приказы.doc'
		end
	when /_date_/ then
	when /_date$/ then
		criteria["#{key}_#{post_values['order_status_id'].to_i == Classifier::OrderStatus::ACTIVATED ? 'activated' : 'created'}"] = value
	else
		criteria[key.to_s] = value
	end
end

criteria['cr.faculty_id'] = u.faculty_id if u.faculty_id and not criteria.empty?

print template('widgets/list/order', criteria.compact, 'item_fs.rb', 'main').render
