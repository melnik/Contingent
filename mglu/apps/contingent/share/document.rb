
require 'extensions'
require 'date'

# TODO: find out how to install class methods via mixins

class Document < Struct.new(:date, :num)
	def to_hash resolve_ids = false
		h = {}; members.each { |var|
			h[var] = send(var.intern)
		}; h
	end

	alias_method :to_h, :to_hash

	def self.from_xml(xml)
		h = Hash.from_xml(xml)
		new(*(members.collect { |var| h[var] }))
	end

	def empty?
		date.empty? || num.empty?
	end

	def to_html
		"от #{date.to_html} &#x2116;#{num.to_html}"
	end
end
