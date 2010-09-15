#!/usr/bin/env ruby

##
# ������ ������� ��� ������� � ����� �������� 2005-09-01, �����
# "����������" �� ����������, ID �������� ���������� � ���������
# ��������� ������. ��������� �������������� ������ �������,
# ��������� ��� ������� ������ �������� ��������.

require 'context'
require 'data/order'

orders = []
faculty_id = ARGV[0].to_i

no = Order.create(8, faculty_id)

Order.list({
	'date_created' => '2005-09-01',
	'order_type_id' => 8,
	'faculty_id' => faculty_id
}, [ 'order_id', 'attributes' ]) { |order_id, attributes|
	next unless attributes['students']
	$stderr.puts("oid=#{order_id}")
	$stderr.puts("students=#{attributes['students'].size}")
	no.attributes['students'] |= attributes['students']
	no.attributes['degree'] = attributes['degree']
	no.attributes['study_type_id'] = attributes['study_type_id']
}

no.fix
puts "#{no.oid}"
