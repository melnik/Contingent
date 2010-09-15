require 'date'

class Term < DateRange
	def self.prev;    current.prev end
	def self.current; new          end
	def self.next;    current.next end

#	private_class_method :new

	def initialize date = Date.today
		@date = date

		self.from, self.till = if even? then
			[ Date.new(academic_year.end,   2, 1), Date.new(academic_year.end, 6, 30) ]
		else
			[ Date.new(academic_year.begin, 7, 1), Date.new(academic_year.end, 1, 31) ]
		end
	end

	##
	# Place term (season) detection logic here
	def even?
		@date.month < 7
	end

	def odd?; not even? end

	def number(course) course * 2 + modifier end

	def prev; self.class.new @date - 365/2 end
	def next; self.class.new @date + 365/2 end

	def academic_year
		(@date.year - modifier.next)..(@date.year.next - modifier.next)
	end

	private

	def modifier; even? ? 0 : -1 end
end
