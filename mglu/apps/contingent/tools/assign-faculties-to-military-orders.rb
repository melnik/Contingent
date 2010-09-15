#!/usr/bin/env ruby

$LOAD_PATH.push '../share'

require '../../../plugins/radical-core/extensions'
require 'extensions'
require 'db'
require 'data/order'
require 'document'
require 'daterange'

$sql.execute("SELECT order_id FROM `order` WHERE order_type_id = 23").fetch { |row|
	o = Order.load row['order_id'].to_i
	faculties = []
	o.each_student(:all, ['faculty_id']) { |faculty_id| faculties << faculty_id }
	faculties.uniq!
	if faculties.length != 1
		$stderr.puts "Error: order \##{o.oid} has students of multiple faculties (#{faculties.join(', ')})"
		next
	end
	sql_query = "UPDATE `order` SET faculty_id = #{faculties[0]} WHERE order_id = #{o.oid}"
	puts sql_query
	$sql.execute sql_query
}