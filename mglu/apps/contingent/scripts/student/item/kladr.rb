require 'auth'

( u = auth_user_current ).require_permissions('student_view')

require 'db'

code = get_values['code'] || ''
parent = get_values['parent'] || ''
additional = get_values['additional'] || ''
address_type = get_values['address_type']
table = get_values['table'].to_i
okato = get_values['okato'] || ''
address = get_values['address'] || ''
post_index = get_values['post_index'] || ''

final = 0
if code =~ /@$/ or additional != ''
	code.delete! "@"
	final = 1
end


	tmpl = template 'student/item/kladr'
	tmpl.address_type = address_type

	a_address = []
	a_address << address if address && address != ''

	if table > 0
		where_phrase = " WHERE address_#{table-1}_id = '#{parent}' AND address_#{table}_id = '#{code}'" if table > 1
		where_phrase = " WHERE address_#{table}_id = #{code}" if table == 1
		$sql.execute("SELECT * FROM address_#{table}#{where_phrase}") { |sth|
			sth.fetch { |row|
				okato = row['code'].strip if row['code'] && row['code'].strip != ''
				post_index = row['post_index'].strip if row['post_index']
				a_address << row['name'].strip.gsub(/\s+/, ' ')
			}
		}
		parent = code
	end
	address = a_address.join(", ")

	address_displayed = address
	address_displayed += ', ' if address_displayed != ''
	address_displayed = "#{post_index}, #{address_displayed}" if post_index && post_index != ''
	tmpl.address_displayed = address_displayed
	tmpl.okato_displayed = "ОКАТО #{okato}" if okato && okato != ''

	tmpl.okato = okato
	tmpl.post_index = post_index
	tmpl.address = address
	tmpl.table = table+1
	tmpl.parent = parent

	if get_values['finish']
		post_index += ', ' if post_index and post_index.strip != ''
		additional = ", #{additional}" if additional
		response.redirect "address.rb?type=#{address_type}&address=#{post_index}#{address}#{additional}&okato=#{okato}&save=1"
	elsif final == 1 || table == 6
		tmpl.code = code
		tmpl.type = 'finish'
		tmpl.additional = additional

	else
		tmpl.type = 'next'
		has_items = has_blank = 0

		query = "SELECT * FROM address_#{table+1} WHERE address_#{table}_id = '#{parent}' ORDER BY name" if table > 0
		query = "SELECT * FROM address_1 ORDER BY name" if table == 0

		tmpl.add_option "#{code}@", '', ' selected="1"'

		option = nil

		$sql.execute(query) { |sth|
			sth.fetch { |option|
				tmpl.add_option option["address_#{table+1}_id"], option['name'], ''
				has_items = 1
			}
		}

		if has_items == 0
			tmpl.code = code
			tmpl.type = 'finish'
			tmpl.additional = additional
		end
	end

	print tmpl.render
