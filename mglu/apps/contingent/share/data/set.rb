require 'extensions'

##
# Класс-обвязка для любых полей типа `SET`, встречающихся в разных таблицах базы.
class Set
	def initialize set
		@set = ( case set
		when String then
			set.split ','
		when Array then
			set
		else
			raise ArgumentError
		end ).uniq.collect do |element|
			element.intern
		end
	end

	def include? element
		@set.include? element
	end

	alias_method :[], :include?

	def to_s
		@set.join ','
	end

	def to_xml
		@set.to_xml
	end

	def quote
		"'#{$sql.quote self}'"
	end
end
