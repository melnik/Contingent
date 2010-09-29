module Generator
	##
	# Класс, представляющий собой один тип приказа. У каждого типа
	# приказа, описанного своей XML-кой, есть:
	#
	# classname - имя класса DAL в ruby-code
	#
	# base - имя базового класса для класса DAL
	#
	# templates - шаблоны форм свойств объекта какого-то типа в
	# приказе для заполнения пользователем в GUI - из них
	# генерируются tmpl этого GUI + поддерживающий его ruby-код;
	# описываются в XML тэгами <template>
	#
	# paragraphes - параграфы; бывают шаблоны, которые специфичны
	# для объекта в каком-то особом параграфе;
	class Order
		def initialize(node)
			@node = node
			@classname = node.attribute('classname').to_s
			@base = node.attribute('base'); @base &&= @base.to_s
			@templates = []
			node.elements.each('template') { |child|
				@templates << Template.new(self, child)
			}
			@conditions = []
			parse_conditions(node)
			@paragraphes = @templates.inject(['0']) { |list, template|
				list |= template.paragraphes(true).to_a
			}
		end
		
		def parse_conditions(el)
			el.elements.each('condition') { |child|
				@conditions << Condition.new(child)
			}
		end

		attr_reader   :classname
		attr_accessor :paragraphes

		def find_variable(name, entity = 'student')
			select_templates(entity).each { |template|
				if (var = template.variable(name))
					return var
				end
			}
			nil
		end

		##
		# Генерирует файлы .tmpl интерфейса пользователя для работы
		# со страничками свойств разных объектов внутри приказа (templates).
		def make_templates
			@templates.each { |template|
				text = template.make_tmpl
				(template.paragraphes || ['']).each { |para|
					write_file("#{TemplatesPath}/#{@classname.downcase}/#{template.entity}#{para}.tmpl", text)
				}
			}
		end

		##
		# Генерирует ruby-код, поддерживающий интерфейс пользователя -
		# странички свойств объектов в приказе (аналог scripts).
		def make_background_code
			stream = Stream.new
			stream << "\
##
## #{SIGNATURE}
##

require 'interface/order/details/common'
require 'expression'

class DetailsFor#{@classname}
	extend DetailsCommon

	CONDITIONS = [
" + @conditions.collect { |c| "\t\t#{c.definition}" }.join(",\n") + "
	]"
	
			stream.indent

			order_templates = select_templates('order')
			raise InputError, "There can be only one order template" if order_templates.length > 1
			stream << "\ndef self.has_order?\n\t#{!order_templates.empty?}\nend"
			unless order_templates.empty?
				template = order_templates.first
				make_order_method(stream, template, 'init')
				make_order_method(stream, template, 'fix')
				make_order_method(stream, template, 'render', :args => 'tmpl')
				make_order_method(stream, template, 'save', :args => 'params', :method => 'collect')
				template.additional_methods(stream)
			end

			['student', 'group'].each { |entity|
				templates = select_templates(entity)
				stream << "\ndef self.has_#{entity}?(paragraph)\n\t[" +
					templates.inject([]) { |list, template| list |= template.paragraphes.to_a }.join(', ') +
					"].member? paragraph\nend"
				next if templates.empty?
				make_method(stream, templates, 'init')
				make_method(stream, templates, 'fix', :args => 'attributes')
				make_method(stream, templates, 'render', :args => 'tmpl')
				make_method(stream, templates, 'save', :args => 'params', :method => 'collect')
				templates.each { |template| template.additional_methods(stream) }
			}

			stream.unindent
			stream.puts "end"
			write_file("#{CodePath}/#{@classname.downcase}.rb", stream.data)
		end

		##
		# Генерирует .tmpl для печатной версии приказа (templates).
		def make_print_version
			printable = @node.elements['printable']
			return unless printable

			stream = Stream.new
			PrintVersion.new(self, printable).write_to(stream)
			
			write_file("#{PrintVersionsPath}/#{@classname.downcase}.tmpl", stream.data)
		end

		DalAttributes = {
			'student' => %w(
				name card_number group_id student_state_id student_status_id
				study_type_id study_form_id gender_id dormitory birth_date citizenship_id
				liabilities profession_code category scholarship_id
				specialization_code degree_code special_enrollment_code
			),
			'group' => %w(
				start_year group_num department_id current_term_number
			)
		}

		##
		# Генерирует ruby-код для DAL данного приказа (share/data).
		def make_dal
			return unless @base
			stream = Stream.new

			# Заголовок
			stream << "\
require 'data/order/#{@base.downcase}'
require 'expression'

class #{@classname} < #{@base}
	TYPE = '#{@node.elements['type'].text}'"

			# Названия параграфов (они же - табы в интерфейсе)
			stream.indent
			paragraph_names = if (names = @node.elements['paragraph_names'])
				names.elements.collect { |x| x.text }
			else
				[tr('В приказе')]
			end
			stream << "PARAGRAPH_NAME = [ #{paragraph_names.collect { |x| "'#{x}'" }.join(', ')} ]\n\n"

			# Список атрибутов, затрагиваемых этим приказом
			affected = get_affected_attributes
			stream << "\nAFFECTED_ATTRIBUTES = {"
			affected.each_pair { |entity, attributes|
				next if (attrs = (attributes[:common] | attributes[:private])).empty?
				stream.puts "\t:#{entity} => %w( #{attrs.join(' ')} ),"
			}
			stream << "\
}

public_class_method :new"

			# Заголовк приказа для печатной формы
			if (titles = @node.elements.find_all { |el| el.name == 'title' }) != []
				stream << "\ndef title"
				stream << "\tconditions = DetailsFor#{@classname}.order_conditions(self)" if titles.find { |el| el.attributes['condition'] }
				
				titles.each { |el|
					if (condition = el.attributes['condition'])
						stream << "\treturn %(#{el.text}) if #{Generator.convert_condition(condition, 'conditions')}"
					else
						stream << "\t%(#{el.text})"
						break
					end
				}
				
				stream << "\tsuper" unless titles.find { |el| not el.attributes['condition'] }
				stream << "end"
			end

			# Метод поиска студентов, которых можно добавить в приказ
			if (qualified = @node.elements['qualified_students'])
				qualified = qualified.deserialize

				stream << "\

QUALIFIED_STUDENTS = #{qualified.inspect}

def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
	where_clauses = convert_search_params(params).compact

	super((where_clauses | convert_search_params(QUALIFIED_STUDENTS).compact), fields) unless where_clauses.empty?
end"
			end

			# Метод для активации приказа
			stream << "
private
def _activate
	super"
			stream.indent
			affected.each_pair { |entity, attributes|
				next if (attrs = attributes[:common]).empty?
				stream << "set :#{entity}, #{make_action(attrs)}.compact"
			}
			stream.puts ''
			affected.each_pair { |entity, attributes|
				next if (attrs = attributes[:private]).empty?
				stream.puts "each_#{entity} #{if entity == 'student' then ':all, ' end}%w( #{entity}_id attributes ) do |#{entity}_id, attributes|"
				stream.indent; stream << "set :#{entity}, #{make_action(attrs)}.compact, [ #{entity}_id ]"; stream.unindent
				stream.puts "end"
			}

			stream.unindent
			stream.unindent
			stream << "\
	end"

			# Метод для проверки возможности активации приказа
			# (заполненность всех полей)
			stream << "
	def try_to_activate
		super
		
		if DetailsFor#{@classname}.has_order?
			fixed_attrs = DetailsFor#{@classname}.fix_order(self)
			if @auto_fix and attributes != fixed_attrs then
				fixed_attrs.each_pair do |k,v|
					attributes[k] = v
				end
				save
			end
		
"
			stream.indent
			affected.each_pair { |entity, attributes|
				next if (attrs = attributes[:common]).empty?
				make_check(stream, attrs)
			}
			stream.unindent
			stream << "\
		end
		
		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			fixed_attrs = DetailsFor#{@classname}.fix_student(self, student_id, paragraph_id, attributes)
			set_student_attributes(student_id, attributes = fixed_attrs) if @auto_fix and attributes != fixed_attrs
			
"
			stream.indent
			affected.each_pair { |entity, attributes|
				next if (attrs = attributes[:private]).empty?
				make_check(stream, attrs)
			}
			stream.unindent
			stream << "\
		end
	end
end"
			write_file("#{DalPath}/#{@classname.downcase}.rb", stream.data);
		end
		
		def check
			@dry_run = true
			
			make_templates
			make_background_code
			make_print_version
			make_dal
		end

		private
		def get_affected_attributes
			affected = {}
			DalAttributes.each_pair { |entity, allowed|
				affected[entity] = {
					:common => convert_affected_attributes(entity_variables('order') & allowed),
					:private => convert_affected_attributes(entity_variables(entity) & allowed)
				}
			}
			affected.delete_if { |k,v| v.empty? }

		end

		def convert_affected_attributes(attrs)
			attrs.collect { |attr|
				case attr
				when 'name' then ['first_name', 'last_name', 'father_name']
				else attr
				end
			}.flatten
		end

		def find_action(attr, attrs_var)
			v = nil
			@templates.each { |t|
				v = t.variable(attr).make_action(:attributes => attrs_var) if t.variable(attr)
			}
			if v.nil? or v.empty? then
				v = case attr
				when /^(.*)_name$/ then
					"#{attrs_var}['name']['#{$1}']"
				when 'liabilities' then
					"(not #{attrs_var}['liabilities'].empty?)"
				else
					"#{attrs_var}['#{attr}']"
				end
			end
			v
		end

		##
		# Генерация DAL: возвращает часть кода, присваивающего конкретное
		# значение атрибутам при активации приказа в зависимости от
		# атрибутов.
		def make_action(attributes)
			action_text = attributes.collect { |attr|
				"\t'#{attr}' => " + find_action(attr, 'attributes')
			}
			return "{\n" + action_text.join(",\n") + "\n}"
		end
		
		##
		# Генерация DAL: возвращает часть кода, проверяющего, определены
		# ли значения атрибутов.
		def make_check(stream, attributes)
			attributes.each { |attr|
				var = @templates.inject(nil) { |r,c| r || c.variable(attr) }
				next if var and var.optional?
				title = var && var.title
				
				if title.empty?
					case attr
					when /^(.*)_name$/ then title = tr 'Ф.И.О.'
					end
				end
				
				if not var.is_a? Generator::Variable::Const
					stream << "\t\traise error(:activation, #{find_action(attr, 'fixed_attrs')}.empty?), " +
						"'#{tr 'Поле'} \"#{title.to_s.from_html}\" #{tr 'не определено'}' if #{find_action(attr, 'attributes')}.empty?"
				end
			}
		end
		
		def make_order_method(stream, template, name, options = {})
			stream << "
def self.#{name}_order(o" + options[:args].to_a.collect { |x| ", #{x}" }.join + ")
	attributes = " + if name == 'render' then "fix_order(o)" else "o.attributes.dup" end + "\n"
	
			stream.indent
			template.send("make_" + (options[:method] || name), stream)
			stream.unindent
			if name == 'init' or name == 'save'
				# Order does not have Order#attributes=
				stream.puts "\tattributes.each_pair { |k,v| o.attributes[k] = v }"
				stream.puts "\to.save"
			end
			if name == 'fix'
				stream.puts "\tattributes\n"
			end
			stream.puts "end"
		end

		def make_method(stream, templates, name, options = {})
			entity = templates.first.entity
			stream.puts "\n\tdef self.#{name}_#{entity}(o, eid, paragraph" + options[:args].to_a.collect { |x| ", #{x}" }.join + ")"
			
			if name == 'render'
				stream.puts "\tattributes = fix_#{entity}(o, eid, paragraph, o.get_#{entity}_attributes(eid))"
			elsif name == 'fix'
				stream.puts "\tattributes = attributes.dup"
			else
				stream.puts "\tattributes = o.get_#{entity}_attributes(eid)"
			end
	
			stream.puts "\tcase paragraph"
			templates.each { |template|
				stream.puts "\twhen #{template.paragraphes.join(',')}"
				stream.indent(2)
				template.send("make_" + (options[:method] || name), stream)
				stream.unindent(2)
			}
			stream.puts "\tend"
			stream.puts "\to.set_#{entity}_attributes(eid, attributes)" if name == 'init' or name == 'save'
			stream.puts "\tattributes" if name == 'fix'
			stream.puts "end"
		end

		##
		# Записывает в файл filename весь буфер data целиком, создавая
		# все необходимые директории (как mkdir -p) в полном пути к filename,
		# если их нет.
		#
		# Если @dry_run == true, то пытается преобразовать данные в локальную
		# кодировку, но не осуществляет записи.
		def write_file(filename, data)
			unless @dry_run
				parts = File.expand_path(filename).split('/')
				(1...(parts.length-1)).each { |idx|
					dirname = parts[0..idx].join('/')
					Dir.mkdir dirname unless File.directory? dirname
				}
				File.open(filename, 'w') { |f| f << data }
			end
		end

		##
		# Удаляет все templates, не соответствующие заданной entity
		def select_templates(entity)
			@templates.collect { |template| template if template.entity == entity }.compact
		end

		def entity_variables(entity)
			select_templates(entity).collect { |template| template.variables }.flatten.uniq
		end
	end
end
