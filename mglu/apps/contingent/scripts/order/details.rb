require 'auth'
auth_user_current.require_permissions('order_project')

require 'extensions'
require 'db'

require 'data/order'
require 'data/group'
require 'data/student'
require 'interface/order/details'

tmpl = template 'order/details'

tmpl.order_id = ( o = Order.load((get_values['order_id'] or post_values['__details_order_id']).to_i) ).oid
unless ( gid = (get_values['group_id'] or post_values['__details_group_id']) ).empty? then
	tmpl.group_id = ( g = Group.load gid.to_i ).oid
end
unless ( sid = (get_values['student_id'] or post_values['__details_student_id']) ).empty? then
	tmpl.student_id = ( s = o.get_student sid.to_i ).oid
end
tmpl.paragraph_id = para = (get_values['paragraph_id'] or post_values['__details_paragraph_id']).to_i

reload_needed = false

if post_values['save'] then
	klass = Kernel::const_get("DetailsFor#{o.class}")
	
	params = {}
	post_values.each_pair { |k,v| params[k.to_s] = v }

	if s then
		reload_needed ||= klass.save_student o, s.oid, para, params
		s = o.get_student s.oid
	elsif g then
		reload_needed ||= klass.save_group   o, g.oid, para, params
		g = Group.load g.oid
	else
		reload_needed ||= klass.save_order   o,              params
	end
else
	tmpl.hide = get_values['hide'].enabled?
end

tmpl.reload_tab = "para#{para}" if reload_needed

klass = Kernel::const_get("DetailsFor#{o.class}")
subtmpl = template "order/details/nodetails"

if s then # Student details
	tmpl.full_name = "#{s.status.to_s.capitalize.to_html} <b>#{s.name.to_html}</b> (форма обучения: <b>#{s.study_type.to_html}</b>)"
	klass.render_student o, s.oid, para, ( subtmpl = template "order/details/#{o.class.file_name}/student#{para}" ) if klass.has_student? para
	subtmpl.__conditions__ = klass.student_conditions(o, s) if subtmpl.respond_to? :__conditions__
elsif g then # Group details
	tmpl.full_name = "Группа <b>#{g.name.to_html}</b>"
	klass.render_group   o, g.oid, para, ( subtmpl = template "order/details/#{o.class.file_name}/group#{para}" ) if klass.has_group? para
else # Order details
	tmpl.full_name = "Приказ &#x2116; <b>#{unless o.number.empty? then o.number.to_html else o.oid.to_html end}</b>"
	klass.render_order   o,              ( subtmpl = template "order/details/#{o.class.file_name}/order" ) if klass.has_order?
	subtmpl.__conditions__ = klass.order_conditions(o) if subtmpl.respond_to? :__conditions__
end

tmpl.hide ||= ( tmpl.data = subtmpl.render ).gsub(/<script language="javascript">.*?<\/script>/m, '').gsub(/\s+?/m, '').empty? # BlackFix

print tmpl.render
