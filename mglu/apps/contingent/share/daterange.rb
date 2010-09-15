
require 'extensions'
require 'date'

# TODO: find out how to install class methods via mixins

class DateRange < Struct.new(:from, :till)
	def to_xml
		h = {}; members.each { |var|
			h[var] = send(var.intern)
		}; h.to_xml
	end
	
	def self.from_xml(xml)
		h = Hash.from_xml(xml)
		new(*(members.collect { |var| h[var] }))
	end
	
	def empty?
		from.empty? || till.empty?
	end
	
	def to_html
		"с #{from.to_html} по #{till.to_html}"
	end
end
