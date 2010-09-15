require 'auth'
( u = auth_user_current ).require_permissions 'user_edit'

require 'data/user'

tmpl = template 'user/list'

# TODO: this must look more accurate in future
criteria = {}; for key, value in get_values do
	criteria[key.to_s] = value
end
# TODO: this must not be separated from get_values
for key, value in post_values do
	if %w( role_id ).include? key.to_s # BlackFix: try to remove this
		criteria["u.#{key}"] = value
	else
		criteria[key.to_s] = value
	end
end

criteria['faculty'] = u.faculty if u.faculty_id and not criteria.empty?

stats = User.list criteria, %w( user_id login name role faculty disabled ) do |id, login, name, role, faculty, disabled|
	tmpl.add_row id, login, name, role, faculty, {
			:disabled  => disabled,
	}
end

if stats then
	for title, stat in stats do
		case title
		when :total then
			tmpl.total = stat
		else
			tmpl.add_stats title, nil

			for category, count in stat do
				tmpl.add_stats category, count
			end
		end
	end
else
	tmpl.total = '0 (поиск не производился)'
end

print tmpl.render
