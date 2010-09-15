module Generator
	##
	# Буфер, в который может выводиться Ruby-код. Предоставляет средства
	# для автоматического форматирования отступов и позволяет вести список
	# requires для данного конкретного кода (чтобы они не дублировались).
	class Stream
		def initialize
			@header = ''
			@outbuf = ''
			@indent = 0
			@requires = []
		end
		
		attr_accessor :header

		def data
			@header + @requires.collect { |req| "#{req}\n" }.join + @outbuf
		end

		def puts(str)
			str = str.to_s.rstrip
			@outbuf << if str.empty? then
				"\n"
			else
				"\t"*@indent + str + "\n"
			end
		end

		def << str
			str.split("\n").each { |line| puts line }
		end

		def indent(delta = 1); @indent += delta; end
		def unindent(delta = 1); @indent -= delta; end

		def require(text)
			@requires << text unless @requires.member?(text)
		end
	end
end
