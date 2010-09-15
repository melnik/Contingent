require 'data/order'

class Test_Order < Test::Unit::TestCase
	def test_01_create
		# Create a new order with @type_id=0 and save it's ID to @@oid
		@@oid = ( o = Order.create 0, 1 ).oid
		@@today = Date.today

		assert_equal Order.type_name(0),               o.class::TYPE
		assert_equal Classifier::Faculty[1][:name],    o.faculty.full_name # BlackFix: temporary(?) hack

		assert_equal Classifier::OrderStatus::PROJECT, o.status
		assert_equal nil,                              o.number

		assert_equal @@today,                          o.date_created
		assert_equal nil,                              o.date_activated
	end

	def test_02_load
		# Load order with ID=@@oid
		o = Order.load @@oid

		assert_equal Order.type_name(0),               o.class::TYPE
		assert_equal Classifier::Faculty[1][:name],    o.faculty.full_name # BlackFix: temporary(?) hack

		assert_equal Classifier::OrderStatus::PROJECT, o.status
		assert_equal nil,                              o.number

		assert_equal @@today,                          o.date_created
		assert_equal nil,                              o.date_activated
	end

	def test_03_save
		# Load order with ID=@@oid
		o = Order.load @@oid

		# ...modify it...
		o.number = 'тест'

		# ...and save
		o.save

		o = Order.load @@oid

		assert_equal 'тест',                           o.number
	end

	def test_04_delete
		# Delete order with ID=@@oid
		Order.delete @@oid
	end
end
