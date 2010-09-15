#!/usr/bin/env ruby

$PHOTO_ROOT = '/srv/radical/photo2/'

f = File.open('photos-koi.txt')
#f.gets

require 'fileutils'
require '../../context'
require 'data/student'

def write_photo(student_id, hexdump)
	path = $PHOTO_ROOT + student_id.to_s[-2..-1]
	FileUtils::mkdir_p(path)
	imgf = File.open("#{path}/#{student_id}.jpg", 'w')
	hexdump.scan(/../).each { |n|
		imgf.putc n.hex
	}
	imgf.close
end

def write_photo_without_id(last, first, father, group, hexdump)
	FileUtils::mkdir_p($PHOTO_ROOT)
	imgf = File.open("#{$PHOTO_ROOT}/#{group}_#{last}_#{first}_#{father}.jpg", 'w')
	hexdump.scan(/../).each { |n| imgf.putc n.hex }
	imgf.close
end

f.each_line { |l|
	if l =~ /^"(.*?)","(.*?)","(.*?)","(.*?)",(.*)$/ then
		group = $1
		last = $2
		first = $3
		father = $4
		hexdump = $5

		student_id = nil

		Student.list({'first_name' => first, 'last_name' => last, 'father_name' => father, 'group' => group }, ['student_id']) { |sid|
			if student_id then
				warn "Duplicate student: #{last} #{first} #{father} #{group}"
			else
				student_id = sid
			end
		}
		if student_id
			write_photo(student_id, hexdump)
		else
			Student.list({'first_name' => first, 'last_name' => last, 'father_name' => father }, ['student_id']) { |sid|
				if student_id then
					warn "Multiple students without group: #{last} #{first} #{father}"
				else
					student_id = sid
				end
			}
			if student_id
				write_photo(student_id, hexdump)
				warn "Student found without group: #{last} #{first} #{father}"
			else
				write_photo_without_id(last, first, father, group, hexdump)
				warn "Student not found even without group: #{last} #{first} #{father}"
			end
		end
	end
}
