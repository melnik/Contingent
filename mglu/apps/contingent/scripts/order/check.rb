require 'auth'

require 'data/order'
require 'data/group'
require 'data/classifier'

tmpl = template 'order/check'

tmpl.order_id = ( o = Order.load(get_values['order_id'].to_i) ).oid

tmpl.type     = o.class::TYPE
tmpl.action   = action = get_values['action'].intern unless get_values['action'].empty?

begin
	case action
	when :freeze then # заморозка
		o.freeze
	when :activate then # ввод в действие
		tmpl.number = number = post_values['number'] || get_values['number'] || o.number
		tmpl.frozen = o.status == Classifier::OrderStatus::FROZEN

		tmpl.place_date 'date', ( date = (post_values['date'] || get_values['date']).to_d ) || Date.today

		unless number.empty? or date.nil? then
			if ((post_values['do_activate'] || get_values['do_activate']).to_i == 1)
				o.activate date, number
			else
				response.redirect "/wait.rb?url=/order/check.rb@action:activate,order_id:#{o.oid},number:#{number},date:#{date},do_activate:1"
			end
		else
			raise # TODO: think about this
		end
	else # простая проверка
		o.check
	end
rescue Order::ActivationError => e
	if post_values['auto_fix'].enabled? and not e.fatal then
		o.auto_fix = true; retry
	else
		tmpl.fatal         = e.fatal
		tmpl.error_message = e.message

		tmpl.student_ids   = e.student_ids
		tmpl.group_ids     = e.group_ids
	end
rescue Order::Error => e
	tmpl.fatal         = true
	tmpl.error_message = e.message
rescue # TODO: think about this
	# Для начала активации не хватает данных => не предпринимаем никаких действий.
	# Если этого не сделать, то алгоритм пойдет по ветке ``else'' и мы покинем данную страницу.
else
	response.redirect case action
	when :freeze, :activate then # к списку приказов
		'index.rb'
	else # обратно - к редактированию приказа
		"item_fs.rb?order_id=#{o.oid}"
	end
end

print tmpl.render
