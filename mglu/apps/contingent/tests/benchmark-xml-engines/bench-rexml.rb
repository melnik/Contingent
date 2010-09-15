#!/usr/bin/env ruby

require 'rexml/document'

d = REXML::Document.new(File.open('data.xml'))
puts d.to_s
