require 'extensions'
require 'db'

Dir.new('apps/contingent/share/interface/order/details').each { |file|
	require "interface/order/details/#{file}" if file =~ /\.rb$/
}
