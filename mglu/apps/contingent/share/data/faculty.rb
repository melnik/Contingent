require 'extensions'

require 'data/department'

##
# Факультет
class Faculty
	NAME = 'факультет'

	# Cписок аббревиатур "виртуальных" факультетов, которым соответствуют кафедры
	VIRTUAL = %w( ЗИ ЮР )

	def self.load oid
		if params = $sql.execute("SELECT *
		                          FROM faculty
		                          WHERE faculty_id = #{oid}").fetch then
			if VIRTUAL.include? params['short_name'] then
				Department.load $sql.execute("SELECT *
				                              FROM department
				                              WHERE faculty_id = #{oid}").fetch['department_id'].to_i
			else
				self.new oid, params
			end
		else
			raise "#{self} ##{oid} not found"
		end
	end

	##
	# ID факультета в БД
	attr_reader :oid

	##
	# Аббревиатура факультета
	attr_reader :name

	##
	# Полное название факультета
	attr_reader :full_name

	##
	# Категория студентов (Set)
	attr_reader :category
	
	##
	# Правильное название должности декана
	def dean_position
		@dean_position ||= "Декан #{name}"
	end

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@name          = params['short_name']
			@full_name     = params['name']
			@dean_position = params['dean_position']

			@category      = params['category'].to_set
		end
	end

	def to_s
		name
	end
end
