#!/usr/bin/env ruby

require 'base64'

$stdin.each_line { |l|
	s = l.split("\t")
	h = Base64.decode64(s[2])
	hash = ''
	h.each_byte { |c| hash += sprintf("%02x", c) }
	puts "INSERT INTO user (login, password_hash, faculty_id, role_id) VALUES ('#{s[1]}', '#{hash}', '#{s[3]}', 1)"
}
