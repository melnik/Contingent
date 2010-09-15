def mangle(var)
	"_#{var.upcase}_"
end

module Generator

	class Printable
		def initialize(xmlnode)
			@xml = xmlnode
			@html_style = xmlnode.attribute('html_style'); @html_style &&= @html_style.to_s
			@condition = xmlnode.attribute('condition'); @condition &&= @condition.to_s
		end
		
		def guarded(stream)
			stream << "<% if " + Generator.convert_condition(condition, mangle('conditions')) + " then %>" unless condition.empty?
			yield
			stream << "<% end %>" unless condition.empty?		
		end
		
		def write_to(stream)
			guarded(stream) { _write_to stream }
		end
		
		attr_reader :xml, :condition, :html_style
		attr_accessor :parent, :index
		
		def print_version
			ret = self
			ret = ret.parent while ret.class != PrintVersion
			ret
		end		
	end

	class Composite < Printable
		def initialize(xmlnode)
			super(xmlnode)
			
			@items = []
			index = 0
			
			xmlnode.elements.each { |el|
				next unless el.is_a? REXML::Element
				
				name = el.name.capitalize
				if PrintVersion.const_defined? name
					item = PrintVersion.const_get(name).new(el)
				
					item.parent = self
					item.index = index
					index += 1
				
					@items << item
				end
			}
		end
		
		attr_reader :items
		
		def variables
			items.collect { |item| (item.respond_to? :variables) ? item.variables : [] }.inject([]) { |a,b| a | b }
		end
		
		def each_recursive(klass = Printable)
			@items.each { |item|
				yield item if item.is_a? klass
				item.each_recursive(klass) { |item| yield item } if item.respond_to? :each_recursive
			}
		end
		
		def dump
			"#{self.class}: [" + items.collect { |item|
				if item.respond_to? :dump
					item.dump
				else
					"#{item.class} <...>"
				end
			}.join(', ') + "]"
		end
		
		def _write_to(stream)
			items.each { |item|
				stream.puts ''
				item.write_to(stream)
			}
		end
	end

	class PrintVersion < Composite
		def initialize(order, xmlnode)
			@order = order
			super(xmlnode)
			
			# stream = Stream.new
			# write_to(stream)
			# puts stream.data
		end
		
		attr_reader :order
	
		def _write_to(stream)

			preamble = @xml.elements['preamble']
			preamble &&= preamble.children[0]

			stream.header << "<!ATTR order !>\n<!-- #{SIGNATURE} -->\n"

			stream << "\
<%
#{mangle 'conditions'} = ::DetailsFor#{@order.classname}.order_conditions(order)
header = import 'header', order
header.conditions = conditions = #{mangle 'conditions'}

%>
<&header&>
<p>#{preamble.to_s.from_html}</p>
<div style=\"text-align: center\"><h3>ПРИКАЗЫВАЮ:</h3></div>
"

			stream << "\
<%
list = Class.new(Array)
list.class_eval {
	alias_method :_old_find, :find
	def find(params = nil)
		if params.nil?
			_old_find { |item| yield item }
		else
			_old_find { |item| ret = params.collect { |k,v| item[k] == v }.inject(true) { |x,y| x && y } }
		end
	end
}
self.class.class_eval {
	def fetch(obj, method, *args)
		keys = args[-1]
		ret = []
		obj.__send__(method, *args) { |*values|
			h = {}; keys.each_index { |i|
				h[keys[i].intern] = values[i]
			}; ret << h
		}
		ret
	end
}

#{mangle 'sets'} = []
#{mangle 'groups'} = nil

"
			variables = self.variables | ['student_id']
			
			items = []
			each_recursive(Section) { |section|
				items << section.collect_students(variables)
			}
			if items.empty?
				items << "fetch(order, :each_student, :all, %w( #{(variables | ['attributes']).join(' ')} ))"
			end
			stream << "\
@students = list.new(
	  #{items.join(" \\\n\t+ ")}
)
#{mangle 'list'} = [@students]

	@groups = #{mangle 'groups'} = list.new(
	fetch(order, :each_group, %w( group_id current_term_number group_num group short_name department_num attributes ))
) if order.respond_to? :each_group

%>
"		
			super(stream)

			stream.puts "\n\n<&import('footer', order)&>"
		end
	end
	
	
	
	
	class PrintVersion
	
		class P < Printable
			def initialize(xmlnode)
				super(xmlnode)
				@text = xmlnode.children[0].to_s.from_html
			end
			
			def _write_to(stream)
				style = " style=\"#{html_style}\"" if html_style
				stream << "<p#{style}>#{@text}</p>\n\n"
			end
		end

		
		class Signature < Printable
		
			SIGNATURES = {
				'rector' => ['Ректор МГЛУ', 'И. И. Халеева'],
				'prorector' => ['Проректор по учебной работе', 'И. В. Манохин'],
				'personnel' => ['Начальник управления кадров', 'Ю. И. Вторушин'],
				'dean' => 'Декан факультета &laquo;<%=order.faculty.name%>&raquo;',
				'deputy_dean' => 'Зам. декана &laquo;<%=order.faculty.name%>&raquo;',
				'deanreceiver' => 'Декан факультета &laquo;<%=receiver%>&raquo;',
				'legal' => 'Юридический отдел',
				'legal-councilor' => 'Советник ректора по правовым вопросам',
				'marketing' => 'Начальник учебно-организационного отдела',
				'union' => 'Профсоюзный комитет студентов',
				'enrollment' => 'Ответственный секретарь приемной комиссии',
				'selection' => 'Председатель отборочной комиссии &laquo;<%=order.faculty.name%>&raquo;',
				'prorector-international' => 'Проректор по международным связям',
				'prorector-security' => 'Проректор по безопасности',
				'foreign' => 'Декан ФОИГ',
				'clerical' => 'Управление делами',
				'dormitory' => 'Управление общежитиями',
				'accountant' => ['Начальник управления бухгалтерского учета и финансового контроля', 'Л. В. Куренкова'],
				'financing' => ['Начальник планово-финансового управления', 'Л. Н. Ермакова'],
				'rehabilitation' => 'Директор ГУИМЦ',
				'rehabilitation_dean' => 'Декан факультета ГУИМЦ',
				'rehabilitation_deputy_dean' => 'Зам. декана факультета ГУИМЦ',
				'military' => 'Директор Военного института',
				'educational' => 'Учебное управление',
			}

			def initialize(xmlnode)
				super(xmlnode)
				@name = xmlnode.attribute('name').to_s
			end
			
			def _write_to(stream)
				stream.puts "<% if (#{mangle 'signature_index'} += 1) == 2 then %><tr>" + 
					"<td colspan=\"3\"><b>Согласовано:</b></td></tr><% end %>"
				
				raise "Unknown signature #{@name}" unless SIGNATURES[@name]
				title, name, aux = SIGNATURES[@name]
				
				if @name == 'deanreceiver' then
					stream << "\
<%
new_group_id = nil
order.each_student(:all, ['attributes']) { |a|
	new_group_id = a['group_id'].to_i
}
receiver = Group.load(new_group_id).faculty.name
if receiver != order.faculty.name then %>
"
				end
				
				stream << "<tr><td>#{title}</td><td class=\"signature\">&nbsp;</td><td class=\"signspacer\"/>" +
					if name.empty?
						"<td class=\"holder-unknown\">&nbsp;</td><tr>"
					else
						"<td class=\"holder\">#{name}</td><tr>"
					end + "<tr><td>#{aux}</td><td class=\"small\">(подпись)</td>" +
					if name.empty?
						"<td class=\"signspacer\"/><td class=\"small\">(расшифровка подписи)</td>"
					else '' end +
					"</tr>\n"
				stream.puts "<% end %>" if @name == 'deanreceiver'
			end
		end


		class Signatures < Composite
			def _write_to(stream)
				stream << "<% #{mangle 'signature_index'} = 0 %>\n<table class=\"signatures\">\n"
				stream.indent
				super(stream)
				stream.unindent
				stream << "</table>\n"
			end
		end


		class Group < Composite
			def initialize(xmlnode)
				super(xmlnode)
				@group_by = xmlnode.attribute('by').to_s
			end
			
			def variables
				[@group_by] | super
			end
			
			def _write_to(stream)
				stream << "\
<%
#{mangle 'sets'}.push Hash.new
#{mangle 'list'}[-1].each { |item| (#{mangle 'sets'}[-1][item[:#{@group_by}]] ||= []) << item }
#{mangle 'sets'}[-1].keys.sort.each { |#{@group_by}|
	next if #{mangle 'sets'}[-1][#{@group_by}].empty?
	#{mangle 'list'}.push #{mangle 'sets'}[-1][#{@group_by}]
	section_index = 0
%>
"
				stream.indent
				super(stream)
				stream.unindent
				stream << "
<%
	#{mangle 'list'}.pop
}
#{mangle 'sets'}.pop
%>
"
			end
		end
		
		
		class Section < Composite
			def initialize(xmlnode)
				super(xmlnode)
				@source = xmlnode.attribute('source'); @source &&= @source.to_s
				if @source == 'order'
					@paragraph = xmlnode.attribute('paragraph')
					if @paragraph
						@paragraph = @paragraph.to_s.to_i
					else
						@paragraph = :all
					end
				elsif @source == 'database'
					@criteria = xmlnode.elements['criteria']
					raise "Criteria must be specified for section with source = database" unless @criteria
					@criteria = @criteria.deserialize
				else
					raise "Section source must be either 'order' or 'database'"
				end
			end
			
			def collect_students(variables)
				"fetch(#{ (@source == 'order') ? "order, :each_student, #{@paragraph.inspect}" : "Student, :list, #{@criteria.inspect}"}, %w( #{ (variables + ((@source == 'order') ? ['attributes'] : [])).join(' ') } )).collect { |item| item | { :SECTION => #{index} } }"
			end
			
			def _write_to(stream)
				stream << "\
<%
#{mangle 'list'}.push(#{mangle 'list'}[-1].collect { |item| item if item[:SECTION] == #{index} }.compact)
unless #{mangle 'list'}[-1].empty?
section_index += 1
%>"

				stream.indent
				super(stream)
				stream.unindent
				
				stream << "\
<%
end
#{mangle 'list'}.pop
%>"
			end
		end		

		
		class List < Composite
		
			def initialize(xmlnode)
				super(xmlnode)
				@style = ListStyles.const_get(xmlnode.attribute('style').to_s.capitalize).new(self)
			end
		
			def _write_to(stream)
				@style.begin_list(stream)

				vars = print_version.variables
				stream << "\
<% #{mangle 'list'}[-1].each { |#{mangle 'item'}|
" + (vars | ['attributes']).collect { |var| "\t#{var} = #{mangle 'item'}[:#{var}]" }.join("\n") + "
%>
"
				stream.indent
				@style.write_row(stream)				
				stream.unindent
				stream << "\
<% } %>
"
				@style.end_list(stream)

			end
			
			def each_visible_column(stream)
				items.each { |column|
					next if column.hidden?
					column.guarded(stream) { yield column }
				}
			end
		end
		

		class Column < Printable

			FIXED_TITLES = {
				'number' => '&#x2116; п/п',
				'name' => 'Ф.И.О.',
				'card_number' => 'Л.д. &#x2116;',
				'student_status' => 'Статус',
				'group' => 'Группа',
				'course' => 'Курс',
				'citizenship' => 'Гражданство',
				'birth_date' => 'Дата рождения',
				'profession' => 'Направление / специальность',
				'profession_code' => 'Код направления / специальности',
				'dormitory' => 'Общежитие',
				'study_type' => 'Форма (основа) обучения',
				'current_term_number' => 'Семестр',
				'passport' => "<% if order.attributes['citizenship'] == 2 then %>Паспорт: <% end %>",
				'confirmed' => '',
			}

			def initialize(xmlnode)
				super(xmlnode)
				@source = xmlnode.attribute('source'); @source &&= @source.to_s
				@name = xmlnode.attribute('name'); @name &&= @name.to_s
				@hidden = !xmlnode.attribute('hidden').nil?
				@title = xmlnode.attribute('title'); @title &&= @title.to_s
				@body = xmlnode.children[0]; @body &&= @body.to_s.from_html
				@empty_text = xmlnode.attribute('empty_text'); @empty_text &&= @empty_text.to_s
			end
			
			attr_reader :name, :source, :title, :empty_text
			
			def hidden?
				@hidden
			end
			
			def variable
				if @source == 'order'
					@variable ||= print_version.order.find_variable @name
				end
			end
			
			def variables
				if @source == 'student'
					[@name]
				else
					[]
				end
			end
			
			def condition
				@condition || (variable && variable.condition)
			end
						
			def has_dimensions?
				if variable and variable.is_a? Generator::Variable::List then true else false end
			end
			
			def title_dimensions
				if has_dimensions?
					[2, variable.fields.size]
				else
					[1, 1]
				end
			end
			
			def body_dimensions
				if has_dimensions?
					["(#{data_source} || []).size", variable.fields.size]
				else
					[1, 1]
				end
			end
			
			def title(row = nil, col = nil)
				if has_dimensions?
					if row == 0 and col == 0
						return @title || variable.title.from_html
					elsif row == 1 and 0...(variable.fields.size).include?(col)
						return variable.fields[col].title
					end
				elsif row.nil? and col.nil?
					if @title
						return @title
					elsif variable
						return variable.title.from_html
					elsif FIXED_TITLES[@name]
						return FIXED_TITLES[@name]
					else
						return ''
					end
				end
				
				raise "Bad title dimensions (#{row}; #{col}) for column #{@source}:#{@name}#{' DIM' if has_dimensions?}"
			end
			
			def body(row = nil, col = nil)
				if has_dimensions?
					return "<& #{data_source}[#{row}]['#{variable.fields[col].name}'] &>"
				elsif row.nil? and col.nil?
					if variable
						return variable.print_version(Stream.new)
					elsif @body
						return @body
					else
						return "<& #{data_source} &>"
					end
				end
				
				raise "Bad body dimensions (#{row}; #{col}) for column #{@source}:#{@name}#{' DIM' if has_dimensions?}"
			end
			
			def is_empty
				if @body or (@name == 'number')
					'false'
				else
					"#{data_source}.empty?"
				end
			end
			
		private
			def data_source
				if variable
					"attributes['#{@name}']"
				elsif @name == 'number'
					mangle 'item_index'
				else
					@name
				end
			end
		end
		
		class << Column
		
			alias_method :old_new, :new
			
			def new(xmlnode)
				name = xmlnode.attribute('name').to_s.capitalize
				unless name.empty?
					while name =~ /(_([a-z]))/
						name[$1] = $2.upcase
					end
					return self::Hacks.const_get(name).new(xmlnode) if self::Hacks.const_defined? name
				end
				old_new(xmlnode)
			end
		end
			
		class Column
		
			module Hacks
			
				Hack = Class.new(Column)
				class << Hack
					def new(xmlnode)
						old_new(xmlnode)
					end
				end
				
				class ProfessionCode < Hack
					def initialize(xmlnode)
						super
					end
					
					def variables
						['profession_code', 'specialization_code', 'degree_code']
					end
					
					def body(row = nil, col = nil)
						super if row || col
						if @source == 'student'
							
							"<%= profession_code %><%= specialization_code || '00' %><%= degree_code || '00' %> " +
								"<%= Classifier::Profession[profession_code][:name] %>"
							
						elsif @source == 'order'
							
							# Сперва пытаемся достать каждый элемент из атрибутов студента.
							# Если не получилось -- из атрибутов приказа (напр., degree часто идет атрибутом приказа).
							# Если и это не получилось -- тянем от студента (т.е. данный элемент отсутствует в приказе).
							
							"<%= (!attributes['profession_code'].empty? && attributes['profession_code']) || order.attributes['profession_code'] || profession_code %>" +
								"<%= attributes['specialization_code'] || order.attributes['specialization_code'] || specialization_code || '00' %>" +
								"<%= attributes['degree_code'] || order.attributes['degree_code'] || degree_code || '00' %> " +
								"<%= Classifier::Profession[attributes['profession_code'] || profession_code][:name] %>"
						end
					end
					
					def is_empty
						if @source == 'student'
							super
						elsif @source == 'order'
							"attributes['profession_code'].empty? && attributes['specialization_code'].empty? && attributes['degree_code'].empty?"
						end
					end
				end
			end
		end


		module ListStyles
		
			class Style
				def initialize(list)
					@list = list
				end
				
				attr_reader :list
				
			private
				def column_title(column, row = nil, col = nil)
					column.title(row, col)
				end
			end
		
		
			class Table < Style
				def begin_list(stream)
					style = " style=\"#{@list.html_style}\"" if @list.html_style
					stream << "<table class=\"printable\"#{style} cellspacing=\"0\"><thead>\n"
					stream.indent
					
					grows, gcols = 0, 0
					@list.items.each { |column|
						next if column.hidden?
						rows, cols = column.title_dimensions
						grows = [rows, grows].max
						gcols = [cols, gcols].max
					}
					
					stream << "<tr>\n"
					first = true
					@list.each_visible_column(stream) { |column|
						if first
							classdef = ' class="printleft"'
							first = false
						else
							classdef = ''
						end
						if column.has_dimensions?
							stream << "\t<th#{classdef} colspan=\"#{column.title_dimensions[1]}\">#{column_title(column, 0,0)}</th>\n"
						else
							stream << "\t<th#{classdef} rowspan=\"#{grows}\">#{column.title}</th>\n"
						end
					}
					stream << "</tr>\n"
					
					(1...grows).each { |row|
						stream << "<tr>\n"
						first = true
						@list.each_visible_column(stream) { |column|
							next unless column.has_dimensions?
							(0...column.title_dimensions[1]).each { |col|
								height = column.title_dimensions[0]
								if first
									classdef = ' class="printleft"'
									first = false
								else
									classdef = ''
								end
								stream << case
								when row < height  then "\t<th#{classdef}>#{column_title(column, row, col)}</th>\n"
								when row == height then "\t<th rowspan=\"#{grows - height}\">&nbsp;</th>\n"
								when row > height  then ''
								end
							}
						}
						stream << "</tr>\n"
					}
					
					stream.unindent
					stream << "</thead><tbody>\n<% #{mangle 'item_index'} = 0 %>\n"
				end
				
				def write_row(stream)
					stream << "\
<% #{mangle 'item_index'} += 1 %>
<% #{mangle 'height'} = [1" + @list.items.collect { |column|
	", " + column.body_dimensions[0] if column.has_dimensions?
}.compact.join() + "].max %>
<% (0...#{mangle 'height'}).each { |#{mangle 'row'}| %>
<tr>
"
					first = true
					@list.each_visible_column(stream) { |column|
						(0...(column.body_dimensions[1])).each { |col|
							if first
								classdef = ' class="printleft"'
								first = false
							else
								classdef = ''
							end
							if column.has_dimensions?
								stream << "\
	<% case
"
								unless column.empty_text.empty?
									stream << "\
	when (#{column.is_empty}) && (#{mangle 'row'} == 0) then %>" + if col == 0 then "<td#{classdef} rowspan=\"<%= #{mangle 'height'} %>\" colspan=\"#{column.body_dimensions[1]}\">#{column.empty_text}</td>" else '' end + "<%
"
								end
								
								stream << "\
	when #{mangle 'row'} <  #{column.body_dimensions[0]} then %><td#{classdef}>#{column.body(mangle('row'), col)}&nbsp;</td><%
	when #{mangle 'row'} == #{column.body_dimensions[0]} then %><td#{classdef} rowspan=\"<%= #{mangle 'height'} - #{mangle 'row'} %>\">&nbsp;</td><%
	end %>
"
							else
								stream << "\
	<% if #{mangle 'row'} == 0 then %><td#{classdef} rowspan=\"<%= #{mangle 'height'} %>\">#{column.body}&nbsp;</td><% end %>
"
							end
						}
					}

					stream << "\
</tr>
<% } %>
"
				end
				
				def end_list(stream)
					stream << "</tbody></table>\n"
				end
			end
			

			class List < Style
				def begin_list(stream)
					style = " style=\"#{@list.html_style}\"" if @list.html_style
					stream << "<ol#{style}>\n"
				end
				
				def write_row(stream)
					style = " style=\"#{@list.html_style}\"" if @list.html_style
					stream << "<li#{style}>\n"
					stream << "<% #{mangle 'has_fields'} = false %>\n"
					stream.indent
					@list.each_visible_column(stream) { |column|
						if column.has_dimensions?
							raise "Dimensional columns cannot appear in lists with style=list"
						else
							stream << "<% unless #{column.is_empty} then %><% if #{mangle 'has_fields'} then %>; \n<% end %>#{column_title(column)}#{column.body}<% #{mangle 'has_fields'} = true; end %>"
						end
					}
					# stream << "<% if #{mangle 'has_fields'} then %>.<% end %>\n"
					stream.unindent
					stream << "</li>\n"
				end
				
				def end_list(stream)
					stream << "</ol>\n"
				end
			
			private
				def column_title(column, row = nil, col = nil)
					if column.name.in? %w( name student_status )
						''
					else
						res = super(column, row, col)
						res += ": " unless res.empty?
						res
					end
				end
			end
			
			
			class Text < Style
				def begin_list(stream)
					stream.puts "<div style=\"#{@list.html_style}\">" if @list.html_style
					stream.puts "<% #{mangle 'item_index'} = 0 %>"
				end
				
				def write_row(stream)
					stream << "<h3>&#167; <%= #{mangle 'item_index'} = #{mangle 'item_index'} + 1 %></h3>\n<p>\n<%\n"
					stream << "#{mangle 'has_fields'} = false %>\n"
					@list.each_visible_column(stream) { |column|
						if column.has_dimensions?
							stream << "<% unless #{column.is_empty} then %><% if #{mangle 'has_fields'} then %>.<% end %>\n"
							stream << "<div>#{column_title(column, 0,0)}\n<table><thead><tr>\n"
							(0...(column.title_dimensions[1])).each { |col|
								stream.puts "\t<th>#{column.title(1, col)}</th>"
							}
							stream << "</tr></thead><tbody>\n<% (0...(#{column.body_dimensions[0]})).each { |#{tr 'row'}| %>\n<tr>\n"
							stream.indent
							(0...(column.body_dimensions[1])).each { |col|
								stream << "<td>#{column.body(tr('row'), col)}</td>\n"
							}
							stream.unindent
							stream << "</tr>\n<% } %>\n</tbody></table></div><% #{mangle 'has_fields'} = false\n"
							
							unless column.empty_text.empty?
								stream << "else %><% if #{mangle 'has_fields'} then %>;<% end %>\n#{column.empty_text}<% "
							end
							stream << "end %>\n"
						else
							stream << "<% unless #{column.is_empty} then %><% if #{mangle 'has_fields'} then %>; <% end %>\n#{column_title(column)}#{column.body}<% #{mangle 'has_fields'} = true; "
							
							unless column.empty_text.empty?
								stream << "else %><% if #{mangle 'has_fields'} then %>;<% end %>\n#{column.empty_text}<% "
							end
							stream << " end %>"
						end
					}
					stream << "<% if #{mangle 'has_fields'} then %>.<% end %>\n</p>\n"
				end
				
				def end_list(stream)
					stream.puts "</div>" if @list.html_style
				end
				
			private
				def column_title(column, row = nil, col = nil)
					if column.name.in? %w( name student_status )
						''
					else
						res = super(column, row, col)
						res += ": " unless res.empty?
						res
					end
				end
			end
		end		
	end
end
