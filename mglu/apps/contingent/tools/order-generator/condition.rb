
require 'document'
require 'daterange'
require 'expression'
require 'empty'

module Generator
	class Condition
		def initialize(el)
			@name = el.attribute('name').to_s
			el.add_attribute('class', 'Hash')
			@condition = el.deserialize
		end
		
		def definition
			condition = @condition.inspect.gsub(/(order|student)__/, '\1:')
			"DetailsCommon::Condition.new('#{@name}', #{condition})"
		end
	end
end