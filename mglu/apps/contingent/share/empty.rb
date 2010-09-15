
##
# Класс, позволяющий проверять x.empty? и !x.empty? сравнением
# (используется в условиях приказов)
class Empty
	def initialize(v = true)
		@value = !!v
	end

	def self.from_xml(xml)
		new(!xml.text.disabled?)
	end
	
	def inspect
		"Empty.new(#{@value.inspect})"
	end
	
	def to_xml
		@value.to_xml
	end

	def === x
		x.empty? == @value
	end
end
