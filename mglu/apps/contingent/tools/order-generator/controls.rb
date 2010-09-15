module Generator

class Variable

	class Const < Variable
		def initialize(template, node)
			super
			@default = node.attribute('value').to_s.from_html
		end

		def make_fix(*args); end
		def make_tmpl(*args); end
		def make_render(*args); end
		def make_collect(*args); end
		def print_version(*args); end
		
		def make_init(stream)
			if @default
				stream << ("attributes['#{@name}'] = " + if @type == 'int' and @default =~ /^\d+/ then
					@default.to_s
				else
					"Proc.new { #{@default} }.call#{converter}"
				end)
			end
			stream.data
		end

		def make_action(*args)
			@default
		end
	end

	class Input < Variable
		def _make_tmpl(stream, options = {})
			super
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || self.tmpl_name
			case @type
			when 'int', 'text'
				stream.puts "<input type='text' name='#{tmpl_name}' value='<&#{attribute}&>'#{@html_attrs} />"
			when 'bool'
				stream.puts "<input type='checkbox' name='#{tmpl_name}' value='yes'<% if #{attribute} then %> checked='1'<% end %> />"
			when 'document'
				stream.require "<script src='/tools/datecontrol.js'></script>"
				stream.puts "&#x2116; <input type='text' name='#{tmpl_name}_num' value='<&#{attribute}['num']&>'#{@html_attrs} />"
				stream.puts "#{tr 'от'} <&import('/widgets/date', '#{tmpl_name}_date', #{attribute}['date'])&>"
			when 'date'
				stream.require "<script src='/tools/datecontrol.js'></script>"
				stream.puts "<&import('/widgets/date', '#{tmpl_name}', #{attribute})&>"
			when 'daterange'
				stream.require "<script src='/tools/datecontrol.js'></script>"
				stream.puts "#{tr 'с'} <&import('/widgets/date', '#{tmpl_name}_from', #{attribute}['from'])&>"
				stream.puts "#{tr 'по'} <&import('/widgets/date', '#{tmpl_name}_till', #{attribute}['till'])&>"
			when 'name'
				stream.puts "#{tr 'фамилия'} <input type='text' name='#{tmpl_name}_last' value='<&#{attribute}['last']&>'#{@html_attrs} />"
				stream.puts "#{tr 'имя'} <input type='text' name='#{tmpl_name}_first' value='<&#{attribute}['first']&>'#{@html_attrs} />"
				stream.puts "#{tr 'отчество'} <input type='text' name='#{tmpl_name}_father' value='<&#{attribute}['father']&>'#{@html_attrs} />"
			when 'group'
				stream.require "<script src='/tools/groupcontrol.js'></script>"
				stream.puts "<&import('/widgets/group', '#{tmpl_name}', { 'group_id' => #{attribute}, 'fixed' => { #{@node.attribute('fixed').to_s.split(',').collect { |x| "'#{x}' => true" }.join(', ')} }})&>"
			end
			stream.data
		end

		def _make_collect(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || "attributes['#{@name}']"
			case @type
			when 'int', 'text', 'date', 'group'
				stream.puts "#{attribute} = params[\"#{tmpl_name}\"]#{converter}"
			when 'bool'
				stream.puts "#{attribute} = params[\"#{tmpl_name}\"].enabled?"
			when 'daterange'
				stream.puts "#{attribute} = DateRange.new(params[\"#{tmpl_name}_from\"].to_d, params[\"#{tmpl_name}_till\"].to_d)"
			when 'document'
				stream.puts "#{attribute} = Document.new(params[\"#{tmpl_name}_date\"].to_d, params[\"#{tmpl_name}_num\"])"
			when 'name'
				stream.<< "#{attribute} = {\n\t'first' => params[\"#{tmpl_name}_first\"],\n\t'last' => params[\"#{tmpl_name}_last\"],\n\t'father' => params[\"#{tmpl_name}_father\"]\n}"
			end
			stream.data
		end

		def print_version(stream, options = {})
			attribute = options[:attribute] || "attributes['#{@name}']"
			case @type
			when 'group'
				stream.puts "<% require 'data/group'; %><%= Group.load(#{attribute}.to_i).name %>"
			when 'name'
				stream.puts "<&#{attribute}['last']&> <&#{attribute}['first']&> <&#{attribute}['father']&>"
			when 'bool'
			else
				stream.puts "<&#{attribute}&>"
			end
			stream.data
		end
	end


	class Classifier < Variable
		def initialize(template, node)
			super
			classname = @type.capitalize
			while classname =~ /(_(.))/ do
				classname[$1] = $2.upcase
			end
			
			@class = ::Classifier.const_get(classname)
			@name ||= @type + '_' + if coded? then 'code' else 'id' end
			@default ||= "first_value(#{@class})"
			@has_custom = node.attributes['custom'].to_s.enabled?
			@display_empty = node.attributes['display_empty'].to_s.enabled?
		end
		
		def tmpl_vars
			super + if @has_custom then ["custom_#{tmpl_name}"] else [] end
		end
		
		def _make_render(stream, options = {})
			super(stream)
			stream.puts "tmpl.custom_#{tmpl_name} = attributes[\"custom_#{@name}\"]" if @has_custom
			stream.data
		end

		def _make_tmpl(stream, options = {})
			super
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || self.tmpl_name
			custom_attribute = options[:custom_attribute] || "custom_#{attribute}"
			stream.puts "<% classifier = #{@class.to_s}.new('#{tmpl_name}')"
			stream.puts "   classifier.select(#{attribute})"
			stream.puts "   classifier = import('#{classifier_tmpl}', classifier, true, #{@has_custom})"
			stream.puts "   classifier.display_empty = false if classifier.respond_to? 'display_empty='" unless @display_empty
			stream.puts "   classifier.custom = #{custom_attribute}" if @has_custom
			stream.puts "   print classifier.to_html %>"
			stream.data
		end

		def _make_collect(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			custom_attribute = options[:custom_attribute] || "attributes['custom_#{@name}']"
			attribute = options[:attribute] || "attributes['#{@name}']"
			stream << "#{attribute} = " + if coded? then
				"params[\"#{tmpl_name}_code\"]"
			else
				"params[\"#{tmpl_name}_id\"].to_s.split(':')[0].to_i"
			end
			stream << "#{custom_attribute} = params[\"custom_#{tmpl_name}\"] if #{attribute} == 0" if @has_custom
			stream << "#{attribute} = nil if #{attribute} == 0" if @display_empty
			
			
			stream.data
		end

		def print_version(stream, options = {})
			attribute = options[:attribute] || "attributes['#{@name}']"
			custom_attribute = options[:custom_attribute] || "attributes['custom_#{@name}']"
			if @has_custom
				stream << "\
<% if #{attribute} == 0 then %>
<& #{custom_attribute} &>
<% else %>
<& #{@class}[#{attribute}][:name] &>
<% end %>"
			else
				stream.puts "<& #{@class}[#{attribute}][:name] &>"
			end
			stream.data
		end

	private

		def coded?
			@class.superclass.in? [::Classifier::CodedID, ::Classifier::Hierarchic]
		end

		def classifier_tmpl
			'/widgets/classifier/' + case
				when @class.superclass.in?([::Classifier::Simple, ::Classifier::Hierarchic]) then 'simple'
				when @class.superclass == ::Classifier::Coded       then 'coded_select'
				when @class.superclass == ::Classifier::CodedID     then 'coded_input'
			end
		end
	end


	class Select < Variable

		Option = Struct.new(:value, :displayed, :printable, :body)
		class Option
			def make_fix(stream); body.each { |child| child.make_fix(stream) }; end
			def make_render(stream); body.each { |child| child.make_render(stream) }; end
			def make_collect(stream, options = {}); body.each { |child| child.make_collect(stream, options) }; end
		end

		def initialize(template, node)
			super
			@options = []
			node.elements.each('option') { |tag|
				@options << Option.new(
					(tag.attribute('value') || tag.attribute('printable') || tag.attribute('title')).to_s,
					(tag.attribute('displayed') || tag.attribute('title')).to_s,
					(tag.attribute('printable') || tag.attribute('title')).to_s,
					@template.process_children(tag)
				)
			}

			unless @default or @options.empty?
				@default = "'#{@options.first.value}'"
				if @type == 'int' and @default =~ /^'(\d+)'$/
					@default = $1
				end
			end
		end

		def _make_tmpl(stream, options = {})
			super
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || self.tmpl_name
			complex_options = !@options.collect { |option| option unless option.body.empty? }.compact.empty?
			stream.puts "<select name='#{tmpl_name}' " + if complex_options then "onChange='#{tmpl_name}_change();'" else '' end + "#{@html_attrs}>"
			@options.each { |option|
				stream.puts "\t<option value='#{option.value.to_html}'<% if #{attribute} == '#{option.value}'#{converter} then print \" selected='1'\" end %>>#{option.displayed.to_html}</option>"
			}
			stream.puts "</select>"

			if complex_options
				@options.each_with_index { |option, index|
					next if option.body.empty?
					stream.puts "<div id='#{tmpl_name}_#{index}' <% if #{attribute} != '#{option.value}'#{converter} then print \" style='display: none'\" end %>>"
					stream.indent
					option.body.each { |item| item.make_tmpl(stream) }
					stream.unindent
					stream.puts "</div>"
				}

				stream << "
<script language='javascript'><!--
var #{tmpl_name}_old_shown = null;
function #{tmpl_name}_convert(value)
{
"
				@options.each_with_index { |option, index| stream.puts "\tif (value == '#{option.value}') return '#{tmpl_name}_#{index}';" }
				stream << "
	return null;
}
function #{tmpl_name}_change()
{
	var new_shown = document.mf.#{tmpl_name}.value;
	if (#{tmpl_name}_old_shown != '') {
		var oldobj = document.getElementById(#{tmpl_name}_convert(#{tmpl_name}_old_shown));
		if (oldobj)
			oldobj.style.display = 'none';
	}
	#{tmpl_name}_old_shown = new_shown;
	var newobj = document.getElementById(#{tmpl_name}_convert(new_shown));
	if (newobj)
		newobj.style.display = '';
}
#{tmpl_name}_change();
//--></script>"

			end
			stream.data
		end

		def make_fix(stream)
			super
			if (option = @options.find { |op| op.value == @default || op.value == @default[1..-2]})
				option.make_fix(stream)
			else
				iterate_options(stream) { |option| option.make_fix(stream) }
			end
			stream.data
		end

		def _make_render(stream)
			super
			iterate_options(stream) { |option| option.make_render(stream) }
			stream.data
		end

		def _make_collect(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || "attributes['#{@name}']"
			stream.puts "#{attribute} = params[\"#{tmpl_name}\"]#{converter}"
			@options.collect { |option| option.body.collect { |var| var.name if var.is_a? Variable } }.flatten.compact.uniq.each { |child|
				stream.puts "attributes['#{child}'] = nil"
			}
			iterate_options(stream, attribute) { |option| option.make_collect(stream, options) }
			stream.data
		end

		def print_version(stream, options = {})
			attribute = options[:attribute] || "attributes['#{@name}']"
			stream.puts "<%"
			iterate_options(stream, attribute, true) { |option|
				stream << "%>#{option.printable}<%"
			}
			stream.puts "%>"
			stream.data
		end

	private

		def iterate_options(stream, attribute = "attributes['#{@name}']", consider_empty = false)
			if @options.find { |op| !op.body.empty? } or consider_empty
				stream.puts "case #{attribute}"
				@options.each { |option|
					next if option.body.empty? and not consider_empty
					stream.puts "when '#{option.value}'#{converter}"
					stream.indent
					yield option
					stream.unindent
				}
				stream.puts "end"
			end
		end
	end

	class Dselect < Variable

		def initialize(template, node)
			super
			@code = node.text
			raise "dselects cannot have default values" if @default
		end

		def _make_tmpl(stream, options = {})
			super
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || self.tmpl_name
			stream << "
<select name='#{tmpl_name}'#{@html_attrs}>
<% #{attribute}[:options].each { |value, title| %>
	<option value='<%=value%>'<% if value == #{attribute}[:value] then print \" selected='1'\" end %>><&title&></option>
<% } %>
</select>"
			stream.data
		end

		def _make_render(stream)
			stream << "\
dselect = { :options => [], :value => attributes['#{@name}'] }
#{tmpl_name}_data(o, eid, paragraph, attributes) { |*args| dselect[:options] << args }
tmpl.#{tmpl_name} = dselect"
			stream.data
		end

		def _make_collect(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || "attributes['#{@name}']"
			stream.puts "#{attribute} = params[\"#{tmpl_name}\"]#{converter}"
			stream.data
		end

		def additional_methods(stream)
			stream.puts "def self.#{tmpl_name}_data(o, eid, paragraph, attributes)"
			stream.indent
			stream << @code
			stream.unindent
			stream.puts "end"
			stream.puts ""
			stream.data
		end

		def print_version(stream)
			raise "Not implemented"
		end
	end

	class List < Variable
		def initialize(template, node)
			super
			@fields = []
			node.elements.each { |child|
				@fields << (var = Variable.create(template, child))
			}
			raise InputError, "Lists cannot have default values" if @default
		end
		
		attr_reader :fields

		def name_prefix=(new_prefix)
			super
			update_names
		end

		def name_suffix=(new_suffix)
			super
			update_names
		end

		def _make_tmpl(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || self.tmpl_name

			stream.require "
<script language='javascript'><!--
function list_change(name, suffix)
{
	var f = document.mf;
	eval('f.keep_' + name + '_' + suffix + '.value = (f.keep_' + name + '_' + suffix + '.value == \"1\" ? \"0\" : \"1\");');
	f.submit();
}
//--></script>"

			super
			stream << "<table#{@html_attrs}>\n\t<tr>"
			@fields.each { |field| stream.puts "\t\t<th>#{field.title.to_html}</th>" }
			stream << "
\t\t<th>&nbsp;</th>
\t</tr>
\t<% (#{attribute} || []).each_with_index { |#{self.tmpl_name}_line, #{self.tmpl_name}_index| %>
\t</tr>"
			render_fields(stream, "<&#{self.tmpl_name}_index&>", :delete)
			stream.puts "\t<% } %>"
			render_fields(stream, "new", :add)
			stream << "\t</tr>\n</table>"
			stream.data
		end

		def _make_collect(stream, options = {})
			tmpl_name = options[:tmpl_name] || self.tmpl_name
			attribute = options[:attribute] || "attributes['#{@name}']"
			stream.puts "collect_row = Proc.new { |index|"
			stream.puts "	row = {}"
			stream.indent
			@fields.each { |field| field.make_collect(stream, {
				:attribute => "row['#{field.name}']",
				:tmpl_name => "#{self.tmpl_name}_#{field.name}_\#{index}"
			} ) }
			stream.unindent
			stream <<   "	row
}
#{attribute} = []
i = 0
while (keep = params[\"keep_#{self.tmpl_name}_\#{i}\"])
	#{attribute} << collect_row.call(i) if keep == '1'
	i += 1
end
#{attribute} << collect_row.call('new') if params['keep_#{self.tmpl_name}_new'] == '1'
"
			stream.data
		end

		def print_version(stream, options = {})
			attribute = options[:attribute] || "attribute['#{@name}']"
			stream << "\
<table class='clean_narrow'>
<% attributes['#{@name}'].each { |item| %><tr>"

			stream.indent
			@fields.each { |field|
				stream.puts "<td style='padding-right: 1em'>"
				stream.indent
				field.print_version(stream, { :attribute => "item['#{field.name}']" })
				stream.unindent
				stream.puts "</td>"
			}
			stream.unindent

			stream << "\
</tr><% } %>
</table>"
			stream.data
		end

	private
		def update_names
			@fields.each { |field| field.name_prefix = tmpl_name }
		end

		def render_fields(stream, suffix, action)
			stream.puts "\t<tr>"
			@fields.each { |field|
				stream.puts "\t\t<td>"
				stream.indent(3)
				field.make_tmpl(stream, {
					:suppress_title => true,
					:attribute => (action == :delete ? "#{self.tmpl_name}_line['#{field.name}']" : "nil"),
					:tmpl_name => "#{self.tmpl_name}_#{field.name}_#{suffix}"
				})
				stream.unindent(3)
				stream.puts "\t\t</td>"
			}
			keep = { :add => 0, :delete => 1 }[action]
			desc = { :add => tr('Добавить'), :delete => tr('Удалить') }[action]
			id   = { :add => 'new', :delete => "<&#{self.tmpl_name}_index&>" }[action]
			img  = { :add => 'add', :delete => 'remove' }[action]
			stream << "
\t\t<td>
\t\t\t<input type='hidden' name='keep_#{self.tmpl_name}_#{id}' value='#{keep}' />
\t\t\t<a href='javascript:list_change(\"#{self.tmpl_name}\", \"#{id}\");'>
\t\t\t\t<img src='/img/#{img}.png' width='22' height='22' alt='#{desc}' title='#{desc}' border='0'/>
\t\t\t</a>
\t\t</td>
\t</tr>"
		end
	end
end

end
