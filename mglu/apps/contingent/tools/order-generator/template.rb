module Generator
	class Template
		def initialize(order, node)
			@order = order
			@tmpl = ''
			@vars = {}
			@node = node
			@items = process_children(node)
			@entity = node.attribute('entity').to_s

			@paragraphes = node.attribute('paragraph') || node.attribute('paragraphes')
			@paragraphes &&= @paragraphes.to_s.split(',')
		end

		attr_reader :entity

		def paragraphes(pure = false)
			return @paragraphes if @paragraphes
			return @order.paragraphes unless pure or @entity == 'order'
		end

		def variables
			@vars.keys
		end

		def variable(name)
			@vars[name].first unless @vars[name].empty?
		end

		def make_tmpl
			stream = Stream.new
			stream.header << "<!ATTR __conditions__ " + @vars.collect { |x, var_list|
				var_list.collect { |var| var.tmpl_vars }
			}.flatten.join(' ') + " !>\n"
			stream.header << "<!-- #{SIGNATURE} -->\n"
			@items.each { |item| item.make_tmpl(stream) }
			return stream.data
		end

		def make_init(stream)
			@items.each { |item| item.make_init(stream) }
			return stream.data
		end

		def make_fix(stream)
			@items.each { |item| item.make_fix(stream) }
			return stream.data
		end		

		def make_render(stream)
			@items.each { |item| item.make_render(stream) }
			return stream.data
		end

		def make_collect(stream, options = {})
			@items.each { |item| item.make_collect(stream, options) }
			return stream.data
		end

		def additional_methods(stream)
			@items.each { |item| item.additional_methods(stream) }
			return stream.data
		end

		def process_children(node)
			items = []
			node.find_all { |child|
				if child.is_a? REXML::Text or child.is_a? REXML::CData
					items << Text.new(child.to_s)
				elsif child.is_a? REXML::Element
					items << process_node(child)
				end
			}
			return items.compact
		end

		def process_node(node)
			var = Variable.create(self, node)
			return nil unless var
			var.name_suffix = @vars[var.name].length.to_s if @vars[var.name]
			(@vars[var.name] ||= []) << var
			return var
		end
	end
end
