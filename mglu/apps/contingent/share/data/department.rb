require 'extensions'

require 'data/faculty'

##
# Кафедра
class Department
	NAME = 'кафедра'

	def self.load oid
		if params = $sql.execute("SELECT *
		                          FROM department d INNER JOIN faculty f USING (faculty_id)
		                          WHERE department_id = #{oid}").fetch(true) then
			self.new oid, params
		else
			raise "#{self} ##{oid} not found"
		end
	end

	##
	# ID кафедры в БД
	attr_reader :oid

	##
	# Аббревиатура кафедры
	attr_reader :name

	##
	# Полное название кафедры
	attr_reader :full_name

	##
	# Номер кафедры на факультете
	attr_reader :number

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@faculty_id = params['d.faculty_id'].to_i
			@number     = params['d.department_num'].to_i unless params['d.department_num'].empty?

			@name = "#{params['f.short_name']}#{@number}"

			@full_name  = params['d.name']
		end
	end

	##
	# Возвращает объект Faculty, соответствующий кафедре
	def faculty
		@faculty ||= if @faculty_id then Faculty.load @faculty_id else Faculty.new nil end
	end

	def to_s
		name
	end
end
