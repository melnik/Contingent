require 'db'

require 'iconv'
require 'cgi'

require 'config'
require 'data/classifier'

class Object
	def quote
		"#{self}"
	end

	alias_method :__to_hash__, :to_hash

	def to_hash resolve_ids = false
		hash = __to_hash__

		for key, value in hash do
			if resolve_ids and key =~ /^(.+)_id$/ then
				hash[ entity_name = $1 ] = if respond_to? entity_name then
					send entity_name
				elsif Classifier[entity_name] then
					Classifier[entity_name][value][:name]
				end

				hash.delete( if hash[entity_name] then key else entity_name end )
			end
		end

		begin
			for method in self.class::EXPORT_METHODS do
				if resolve_ids then
					hash[method] = send method
					hash[method] = hash[method].resolve_ids if hash[method].is_a? Hash
				elsif respond_to? "#{method}_id" then
					hash["#{method}_id"] = send method
				else
					hash[method] = send method
				end
			end
		rescue NameError
		end

		return hash
	end

	alias_method :to_h, :to_hash
end

class NilClass
	def to_set
	end

	def quote
		'NULL'
	end

	def enabled?
		false
	end

	def disabled?
		false
	end

	def utf_encode
		nil
	end

	def utf_decode
		nil
	end
end

class FalseClass
	def quote
		'0'
	end
end

class TrueClass
	def quote
		'1'
	end
end

class Integer
	def to_uuid entity = nil
		if entity then
			$UUID_MAPPING_PREFIX[entity] + to_hex(6)
		else
			to_hex(16).gsub /(........)(....)(....)(....)(............)/, '\1-\2-\3-\4-\5'
		end
	end

	def year
		2000 - self / 50 * 100 + self
	end
end

class Date
	def quote
		"'#{self}'"
	end
end

class Time
	def quote
		self.strftime("'%Y-%m-%d %H:%M:%S'")
	end
end

UUID_RE = /^([0-9a-f]{8})-([0-9a-f]{4})-([0-9a-f]{4})-([0-9a-f]{4})-([0-9a-f]{12})$/

$utf2db = Iconv.new $db_encoding, 'utf-8'
$db2utf = Iconv.new 'utf-8', $db_encoding

class String
	def to_id force = false
		for entity, prefix in $UUID_MAPPING_PREFIX do
			return {
				:entity => entity,
				:id     => $1.hex
			} if self =~ /^#{prefix}([0-9a-f]{12})$/
		end

		($1 + $2 + $3 + $4 + $5).hex if force and self =~ UUID_RE
	end

	def to_set
		split(',').to_set do |element|
			element.strip.to_sym
		end
	end

	def utf_encode
		$db2utf.iconv self
	end

	def utf_decode
		$utf2db.iconv self
	end

	def quote
		"'#{$sql.quote self}'"
	end

	def enabled?
		in? %w( 1 true yes )
	end

	def disabled?
		in? %w( 0 false no )
	end
end

# class Array
# 	def compact!
# 		each_with_index do |value, i|
# 			self[i] = value.compact if value.respond_to? :compact
# 		end
#
# 		reject! do |value|
# 			value.empty?
# 		end
# 	end
#
# 	def compact
# 		dup.compact!
# 	end
# end

class Array
	def quote
		"(#{collect { |x| x.quote }.join(', ')})"
	end
end

class Hash
	def compact!
		for key, value in self do
			unless key.empty? then
				self[key] = value.compact if value.respond_to? :compact
				delete key if self[key].empty?
			else
				delete key
			end
		end
	end

	def quote
		self.to_xml.quote
	end

	def resolve_ids
		dup.resolve_ids!
	end

	def resolve_ids!
		for key, value in self do
			if key =~ /^((current)_)?(.+)_id$/ and classifier = Classifier[$3] then
				self["#{$1}#{$3}"] = classifier[delete(key)][:name]
			elsif value.is_a? Integer and classifier = Classifier[key] then # BlackFix: legacy support
				self[key] = classifier[value][:name]
			elsif value.is_a? Hash then
				self[key] = value.resolve_ids
			end
		end
	end
end

require 'set'
class Set
	def to_s
		@hash.keys.join ','
	end

	def to_xml
		@hash.keys.to_xml
	end

	def quote
		"'#{$sql.quote to_s}'"
	end

	alias_method :[], :include?
end

def convert_search_params params
	params.collect do |key, value|
		case key.to_s
		when 'faculty' then
			"f.short_name = #{value.quote}"
		when 'course' then
			"FLOOR(current_term_number/2+0.5) = #{value}"
#			"current_term_number = #{value}*2"
		when 'term' then
			"current_term_number = #{value}"
		when 'department' then
			if value =~ /^(\D+?)(\d+?)$/ then
				{
					'f.short_name'        => $1.quote,
					'd.department_num'    => $2,
				}.compact.join ' = ', ' AND '
			else
				false.quote
			end
		when 'group' then
			if value =~ /^(\D+?)((\d+?)?(-(1?\d)-(\d+))?)?$/ then
				{
					'f.short_name'        => $1.quote,
					'd.department_num'    => unless $2.empty? then $3.quote end, # BlackFix: this is here to handle "ordinary" departments
					'current_term_number' => $5,
					'g.group_num'         => $6,
				}.compact.join ' = ', ' AND '
			else
				false.quote
			end
		when 'name' then
			value.gsub! /\+/, ' ' # BlackFix: the case of this ugly hack is that '+' goes instead of ' ' at the begining in get_values
			if value =~ /^(\S+?)?(\s+(\S+?)(\s+(\S+?))?)?$/ then
				({
					'last_name'   => "#{$1}%".quote,
					'first_name'  => "#{$3}%".quote,
					'father_name' => "#{$5}%".quote,
				}.compact.join ' LIKE ', ' AND ')
			else
				false.quote
			end
		when 'number' then
			"(number LIKE #{"#{value}%".quote} OR (number IS NULL AND o.order_id = #{value.to_i}))"
		when 'user_name' then
			value.gsub! /\+/, ' ' # BlackFix: the case of this ugly hack is that '+' goes instead of ' ' at the begining in get_values
			if value =~ /^(\S+?)?(\s+(\S+?)(\s+(\S+?))?)?$/ then
				"u.full_name LIKE #{"#{$1}%#{" #{$3}%#{" #{$5}%" if $5}" if $3}".quote}"
			else
				false.quote
			end
		when 'student_state' then
			case value
			when 'studying' then
				"student_state_id IN (#{Classifier::StudentState::STUDYING}, #{Classifier::StudentState::VACATION}, #{Classifier::StudentState::TRAINEE})"
			when 'quit' then
				"student_state_id IN (#{Classifier::StudentState::EXPELLED}, #{Classifier::StudentState::GRADUATED})"
			end
		when 'category' then
			"s.category = #{value.quote}"
		when /^min_(.+)$/ then
			"#{$1} >= #{value.quote}"
		when /^max_(.+)$/ then
			"#{$1} <= #{value.quote}"
		when /^(skip_)?(student|group|department|faculty|college|order|applicant)_id$/ then
			"#{'NOT ' if $1}(#{$2[0].chr}.#{$2}_id = #{value.quote})"
		when /_id$/, /_num$/, /^date_/, /_date$/, 'dormitory', 'liabilities' then
			if value.class == Array
				"#{key} IN (#{value.collect { |x| x.quote }.join ', '})"
			else
				"#{key} = #{value.quote}"
			end
		when 'profession_code' then
			"s.#{key} LIKE #{"#{value}%".quote}"
		when /\./, 'attributes', 'html' then
			raise "Bad field request: #{key}"
		else
			if classifier = Classifier[key] then
				"#{key}_id = #{classifier[:name => value][:id]}"
			elsif value.is_a? Array
				"#{key} IN (#{value.collect { |v| v.quote }.join(', ')})"
			else
				"#{key} LIKE #{"#{value}%".quote}"
			end
		end. \
			gsub(/\s?=\s*NULL/i, ' IS NULL'). \
			gsub(/\s?=\s*\(/, ' IN (') unless value.empty?
	end
end

##
# Преобразует полученные поля из базы данных.
#
# row - Hash, из которого можно извлекать поля таблиц БД, в том числе не
# только нужные напрямую, но и нужные для образования виртуальных полей.
#
# fields - массив строк, описывающих поля. Поля могут быть:
#
# * реальными полями таблиц БД, в этом случае они будут преобразованы в
# объект Ruby соответствующего класса
#
# * виртуальными полями, вычисляемыми из других полей таблиц БД
#
# Виртуальные поля включают в себя:
#
# * faculty - аббревиатура факультета ("АК")
# * course - номер курса (1)
# * department - шифр кафедры ("АК1")
# * group - полный шифр группы ("АК1-1-1")
# * name - собранное ФИО студента ("Иванов Иван Иванович")
#
# Возвращает массив объектов, по одном объекту на элемент массива fields
def convert_sql_result row, fields
	row, old_row = row.dup, row
	old_row.each_pair { |k,v|
		if k =~ /\./
			table, field = k.split('.')
			row[field] = v
		end
	}
	
	fields.collect do |field|
		case field
		when 'faculty' then
			row['short_name']
		when 'course' then
			(row['current_term_number'].to_i / 2.0).round
		when 'department' then
			"#{row['short_name']}#{row['department_num']}"
		when 'group' then
			if row.include? 'group_name' then
				row['group_name']
			else
				"#{row['short_name']}#{row['department_num']}-#{row['current_term_number']}-#{row['group_num']}"
			end
		when 'name' then
			if row.include? 'last_name' then
				"#{row['last_name']} #{row['first_name']} #{row['father_name']}"
			elsif row.include? 'full_name' then
				row['full_name']
			else
				row[field]
			end
		when /^(?:(s|f)_)?category$/ then
			( if $1 then
				row["#{$1}_category"]
			else
				row['s_category'] || row['category']
			end ).to_set
		when /^i_/, /_id$/, /_num$/, 'current_term_number' then
			row[field].to_i if row[field]
		when /^date_/, /_date$/ then
			row[field].to_d
		when 'attributes' then
			row[field].to_h
		when /^is_/, /^has_/, 'dormitory', 'liabilities', 'disabled' then
			row[field] == '1'
		else
			if cid = (row["#{field}_id"] && row["#{field}_id"].to_i) || row["#{field}_code"] and not row.include? field then
				Classifier[field][cid][:name]
			else
				row[field]
			end
		end
	end
end
