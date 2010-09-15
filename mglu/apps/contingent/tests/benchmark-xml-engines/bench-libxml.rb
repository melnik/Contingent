#!/usr/bin/env ruby

require 'rubygems'
require 'xml/libxml'

d = XML::Document.file('data.xml')
puts d.to_s
