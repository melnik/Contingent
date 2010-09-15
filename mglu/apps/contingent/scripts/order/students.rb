require 'auth'
( u = auth_user_current ).require_permissions('order_project')

require 'data/order'

tmpl = template 'order/students/list'

# TODO: this must look more accurate in future
criteria = {}; for key, value in get_values do
	case key
	when :order_id then
		tmpl.order_id = ( o = Order.load value.to_i ).oid
	when :paragraph_id, 'paragraph_id' then # BlackFix: fuck the Radical!
		tmpl.paragraph = para = unless value.empty? then
			value.to_i
		else
			nil
		end
	when :switch_to then
		tmpl.switch_to = if value == 'self' then
			unless get_values['paragraph_id'].empty? then
				"para#{get_values['paragraph_id'].to_i}"
			else
				'list'
			end
		else
			tmpl.refresh = "para#{value}"
		end
	when :refresh
		tmpl.refresh = value
	else
		criteria[key.to_s] = value
	end
end
# TODO: this must not be separated from get_values
for key, value in post_values do
	criteria[key.to_s] = value
end

last_group = '-'

list = proc { |student_id, name, card_number, group_id, group|
	if group != last_group then
		tmpl.add_row o.oid, 'group', group_id, nil, group, nil, para
		last_group = group
	end
	tmpl.add_row o.oid, 'student', student_id, name, group, card_number, para
}

stats = if not para and o.class::TARGET.in? [ :student, :applicant ] then
	o.search_available criteria, %w(student_id name card_number group_id group), &list
else
	o.each_student     para,     %w(student_id name card_number group_id group), &list
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
end

if o.class::PARAGRAPH_NAME.size == 1 or o.respond_to? :add_students then
	tmpl.can_add = para.nil?
end
if o.class::PARAGRAPH_NAME.size > 1 and o.respond_to? :move then
	tmpl.can_move = true

	unless para and o.class::PARAGRAPH_NAME.size == 2 then
		tmpl.can_select = true

		o.class::PARAGRAPH_NAME.each_with_index do |name, i|
			tmpl.add_destination i, name unless i == para
		end
	end
end

tmpl.can_remove = ( para and o.editable? )

print tmpl.render
