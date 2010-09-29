module Generator
	class Variable
		def self.create(template, node)
			raise "No node name for node #{node.inspect}" if node.name.empty?
			if const_defined?(node.name.capitalize)
				const_get(node.name.capitalize).new(template, node)
			else
				$stderr.puts "Warning: unknown tag '#{node.name}'"
				nil
			end
		end

		def initialize(template, node)
			@template = template
			@node = node
			@name = node.attribute('name'); @name &&= @name.to_s
			@type = node.attribute('type'); @type &&= @type.to_s
			@condition = node.attribute('condition'); @condition &&= @condition.to_s
			@default = node.attribute('default'); @default &&= @default.to_s.from_html
			@optional = node.attribute('optional').to_s.enabled? || @default == 'nil'
			@html_attrs = node.attributes.collect { |k,v|
				if k =~ /^['"]?html_(.*?)["']?$/
					"#{$1}='#{v.to_html}'"
				end
			}.compact.join(' ')
			@hidden = node.attribute('hidden').to_s.enabled?
			@html_attrs = ' ' + @html_attrs unless @html_attrs.empty?
		end

		def inspect
			"\#<#{self.class}: name='#{name}', type='#{type}'>"
		end

		attr_reader :name, :type, :condition
		attr_accessor :name_prefix, :name_suffix
		
		def hidden?
			@hidden
		end
		
		def optional?
			@optional
		end

		def title
			@node.attribute('title') && @node.attribute('title').to_s
		end

		def tmpl_name
			res = @name
			res = @name_prefix + '_' + res if @name_prefix
			res = res + '_' + @name_suffix if @name_suffix
			return res
		end
		
		def tmpl_vars
			[tmpl_name]
		end

		def _make_tmpl(stream, options = {})
			stream.puts title.to_s.from_html unless options[:suppress_title]
			stream.data
		end
		
		def make_tmpl(stream, options = {})
			return '' if hidden?
			stream.puts "<% if " + Generator.convert_condition(@condition, '__conditions__') + " then %>" unless @condition.empty?
			_make_tmpl(stream, options)
			stream.puts "<% end %>" unless @condition.empty?
		end

		def make_fix(stream)
			if @default
				stream << ("attributes['#{@name}'] ||= " + if @type == 'int' and @default =~ /^\d+/ then
					@default.to_s
				else
					"Proc.new { #{@default} }.call#{converter}"
				end)
			end
			stream.data
		end
		
		def make_init(stream)
			stream.data
		end

		def _make_render(stream)
			stream.puts "tmpl.#{tmpl_name} = attributes['#{@name}']"
			stream.data
		end
		
		def make_render(*args)
			return '' if hidden?
			_make_render(*args)
		end
		
		def make_collect(*args)
			return '' if hidden?
			_make_collect(*args)
		end

		def make_action(options = {})
			attrs = options[:attributes] || 'attributes'
			case @name
			when 'liabilities' then
				"(not #{attrs}['liabilities'].empty?)"
			else
				"#{attrs}['#{@name}']"
			end
		end

		def additional_methods(stream); end

		private
		def converter
			case @type
			when 'int','group' then '.to_i'
			when 'string' then '.to_s'
			when 'date' then '.to_d'
			else ''
			end
		end
	end

	class Text
		def initialize(text)
			@text = text.strip
			@text += '<br/>' if @text == '' and text.count("\n") >= 2
		end

		def make_tmpl(stream, options = {})
			stream << @text.from_html
		end

		def make_fix(stream); end
		def make_init(stream); end
		def make_render(stream); end
		def make_collect(stream, options = {}); end
		def additional_methods(stream); end
		def print_version(stream = nil); end
		
		def hidden?; false; end
	end
end
