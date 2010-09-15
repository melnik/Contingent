require 'auth'
( u = auth_user_current ).require_permissions('order_project')

require 'data/order'
require 'interface/tabs'

o = Order.load get_values['order_id'].to_i

tabs = []; o.class::PARAGRAPH_NAME.each_with_index do |name, i|
	tabs << {
		'title' => name,
		'name'  => "para#{i}",
		'url'   => "students.rb?order_id=#{o.oid}&paragraph_id=#{i}",
	}
end

case o.class::TARGET
when :student, :applicant then
	tabs << {
		'title' => 'Результаты поиска',
		'name'  => 'list',
		'url'   => 'empty.html',
	}
when :virtual then
	tabs << {
		'title' => 'Добавление студента',
		'name'  => 'list', # stupid name for this tab 8|
		'url'   => "new_student.rb?order_id=#{o.oid}",
	}
when :group, :course, :order then
	tabs << {
		'title' => 'Остальные',
		'name'  => 'list',
		'url'   => "students.rb?order_id=#{o.oid}",
	}
end

print make_tabs(tabs)
