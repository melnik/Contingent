require 'cgi'
require 'date'
require 'iconv'
require 'rexml/document'

class Object
	def self.from_xml xml
		obj = allocate; for element in xml.elements do
			obj.instance_variable_set "@#{element.name}", element.deserialize
		end; obj
	end

	def to_xml
		unless ( hash = to_hash ).empty? then
			hash.to_xml
		else
			"#{self}"
		end
	end

	def to_html
		"#{self}"
	end

	def url_encode
		CGI.escape to_s
	end

	def to_hash
		hash = {}; for var in instance_variables do
			hash[var.gsub(/^@/, '')] = instance_variable_get var if respond_to? var.gsub(/^@/, '')
		end; hash
	end

	alias_method :to_h, :to_hash

	def empty?
		to_s.empty?
	end

	def in? scope
		scope.include? self
	end
end

class NilClass
	def self.from_xml xml
	end

	def to_date
	end

	alias_method :to_d, :to_date

	def empty?
		true
	end

	def [] index
	end
end

class FalseClass
	def self.from_xml xml
		false
	end

	def empty?
		false
	end
end

class TrueClass
	def self.from_xml xml
		true
	end

	def empty?
		false
	end
end

class Numeric
	def empty?
		false
	end
end

class Integer
	def self.from_xml xml
		xml.text.to_i
	end

	def to_hex bytes_padding = nil
		"%0#{bytes_padding * 2}x" % self
	end

	alias_method :to_x, :to_hex

	def prev
		self - 1
	end
end

class Range
	def self.from_xml xml
		h = Hash.from_xml xml
		new(h['min'], h['max'])
	end

	def to_hash
		{ 'min' => min, 'max' => max }
	end
end

class Date
	def self.from_xml xml
		xml.text.to_d
	end

	def to_date
		self
	end

	alias_method :to_d, :to_date

	alias_method :to_xml, :to_s

	def to_html
		sprintf '%02d.%02d.%04d', mday, mon, year
	end

	def empty?
		false
	end
end

class String
	def self.from_xml xml
		# avfix: xml.text == null sometimes
		xml.text.to_s.utf_decode
	end

	def to_xml
		REXML::Text.normalize self
	end

	def from_html
		CGI.unescapeHTML(self).gsub('&apos;', '\'')
	end

	def to_html
		CGI.escapeHTML self
	end

	def to_date
		begin
			Date.parse self
		rescue ArgumentError
		end
	end

	alias_method :to_d, :to_date

	def to_hash
		begin
			( REXML::Document.new "<?xml version=\"1.0\" encoding=\"#{$db_encoding}\"?><__root__ class=\"Hash\">#{self}</__root__>" ).root.deserialize || {}
		rescue REXML::ParseException, RuntimeError
		end
	end

	alias_method :to_h, :to_hash
end

class Regexp
	def self.from_xml xml
		# avfix: xml.text == null sometimes
		new xml.text.to_s.utf_decode
	end

	def to_xml
		REXML::Text.normalize to_s
	end
end


class Symbol
	def to_xml
		to_s.to_xml
	end
	
	def self.from_xml xml
		String.from_xml(xml).intern
	end
end


class Array
	def self.from_xml xml
		xml.elements.collect do |element|
			element.deserialize
		end
	end

	def to_xml
		( self.collect do |element|
			"<item class=\"#{element.class}\">#{element.to_xml}</item>"
		end ).join
	end
end

class Hash
	def self.from_xml xml
		hash = {}; for element in xml.elements do
			hash[element.name] = element.deserialize
		end; hash
	end

	def | hash
		result = dup; for key, value in hash do
			result[key] = value
		end if hash; result
	end

	def & hash
		reject do |key, value|
			not hash.include? key or (hash.is_a? Hash and value != hash[key])
		end
	end

	def join pair_glue = $,, elements_glue = $,
		( collect do |key, value|
			key.to_s + pair_glue + value.to_s
		end ).join elements_glue
	end

	def compact!
		reject! do |key, value|
			value.nil? or key.nil?
		end
	end

	def compact
		dup.compact!
	end

	def to_xml
		( collect do |key, value|
			"<#{key} class=\"#{value.class}\">#{value.to_xml}</#{key}>"
		end ).join
	end

	def url_encode
		( collect do |key, value|
			case value
			when Array then
				"#{key.url_encode}=#{value.collect do |v|
					v.url_encode
				end.join "&#{key.url_encode}="}"
			else
				"#{key.url_encode}=#{value.url_encode}"
			end
		end ).join '&'
	end

	alias_method :to_h, :to_hash
end

class REXML::Element
	def deserialize
		Kernel.const_get(self.attributes['class'] || 'String').from_xml self
	end
end
