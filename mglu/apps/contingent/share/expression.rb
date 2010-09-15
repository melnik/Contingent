
##
# Класс, позволяющий обойти quoting строк при подставлении
# их куда-либо.
class Expression
	def initialize(str)
		@str = str
	end

	def self.from_xml(xml)
		new(xml.text)
	end
	
	def to_s
		@str
	end
	
	def to_xml
		@str.to_xml
	end

	def inspect
		@str
	end
	
	def quote
		@str
	end
end
