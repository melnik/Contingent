#!/usr/bin/env ruby

$KCODE = 'UTF8'

##
# Settings
URL_2 = 'http://127.0.0.1:8090/studentWebservice/services/StudentsService'
URL_1 = 'http://127.0.0.1:80/SOAP'
#URL_1 = 'http://greycat.house28.ru/php-ws/'
WIREDUMP_1 = File.open('wiredump_1.log', 'w')
WIREDUMP_2 = File.open('wiredump_2.log', 'w')
LOGFILE = File.open('test.log', 'w')

require 'contingentDriver'

class SOAPTester
	def initialize
		@count = 0
		@obj1 = StudentsSrvPort.new(URL_1)
		@obj1.wiredump_dev = WIREDUMP_1
		@obj2 = StudentsSrvPort.new(URL_2)
		@obj2.wiredump_dev = WIREDUMP_2
	end

	def do_test(method, arg)
		@count += 1
		LOGFILE.puts "Test #{@count}: #{method.to_s}"
		r1 = @obj1.send(method, arg)
		LOGFILE.puts r1.inspect
		r2 = @obj2.send(method, arg)
		LOGFILE.puts r2.inspect
	end
	
	def do_call(method, arg = nil)
		if arg.nil?
			r1 = @obj1.send(method)
		else
			r1 = @obj1.send(method, arg)
		end
		LOGFILE.puts r1.inspect
	end
end

t = SOAPTester.new
#t.do_call('version')
#t.do_call('get', { :id => '67b8a137-8636-4c20-9649-000000016b48' })
#t.do_call('get', { :id => 'b6a5b6ff-8ba2-4c1d-8478-00000000021c' })
#t.do_call('listOrders',
#                { :type => '764b4695-00e2-4dde-ab34-000000000007' })
#t.do_call('listOrders',
#                { :type => '764b4695-00e2-4dde-ab34-000000000002', 'dateStart' => '2005-09-01', 'dateEnd' => '2006-08-30' })
#t.do_call('get', { :id => 'b6a5b6ff-8ba2-4c1d-8478-00000000f57c' })

#t.do_call('get', '67b8a137-8636-4c20-9649-000000016b48')
#t.do_call('get', { :id => '67b8a137-8636-4c20-9649-0000000155c7' })
#t.do_call('reportGraduated', { :year => 2006, :department => 'АК1' })
t.do_call('listStudents', { :query => { 'lastName' => 'Якшин' } })
#t.do_test('listOrderTypes', nil)
#t.do_test('listOrders', { :orderTypeId => 1, :fromDate => Date.new(2005,1,1), :toDate => Date.new(2005,2,1) })
#t.do_test('listByGroup', { :group => 'ИУ7-21' })
#t.do_test('listByFaculty', { :faculty => 'ЗИ' })
#t.do_test('listByDepartment', { :department => 'АК1' })
