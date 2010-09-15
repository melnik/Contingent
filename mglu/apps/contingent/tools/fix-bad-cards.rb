#!/usr/bin/env ruby

Dir.chdir '..'
$LOAD_PATH.push('share')
require 'extensions'
require '../../plugins/radical-core/extensions'

# Количество неправильных номеров
c = $sql.execute("SELECT COUNT(card_number) FROM student WHERE card_number NOT REGEXP '[0-9][0-9].[0-9][0-9][0-9]';").fetch_array[0].to_i
puts "Bad card numbers: #{c}"

# Удаление минусов из второй части
r = $sql.execute("SELECT student_id, card_number FROM student WHERE card_number REGEXP '[0-9][0-9].-.*'")

while (s = r.fetch_array) do
	student_id, card_number = s
	puts card_number
	card_number.gsub!(/-/, '')
	puts card_number
	$sql.execute("UPDATE student SET card_number='#{card_number}' WHERE student_id = #{student_id}")
end

# 0Л123 -> 00Л123
r = $sql.execute("SELECT student_id, card_number FROM student WHERE card_number REGEXP '^0[ЛО]'")

while (s = r.fetch_array) do
	student_id, card_number = s
	puts card_number
	card_number.gsub!(/(^0[^0-9])/, '0\1')
	puts card_number
	$sql.execute("UPDATE student SET card_number='#{card_number}' WHERE student_id = #{student_id}")
end

# 0Л123 -> 00Л123
r = $sql.execute("SELECT student_id, card_number FROM student WHERE card_number REGEXP '^[0-9][0-9].[0-9][0-9]$'")

while (s = r.fetch_array) do
	student_id, card_number = s
	puts card_number
	card_number.gsub!(/^([0-9][0-9])(.)([0-9][0-9])$/, '\1\20\3')
	puts card_number
	$sql.execute("UPDATE student SET card_number='#{card_number}' WHERE student_id = #{student_id}")
end

# 99ЛО12 -> 99Л012 (большая русская О превращается в 0)
r = $sql.execute("SELECT student_id, card_number FROM student WHERE card_number REGEXP '[0-9][0-9]..*О.*';")

while (s = r.fetch_array) do
	student_id, card_number = s
	puts card_number
	card_number.gsub!(/О/, '0')
	puts card_number
	$sql.execute("UPDATE student SET card_number='#{card_number}' WHERE student_id = #{student_id}")
end

Dir.chdir 'tools'
