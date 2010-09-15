require 'extensions'

class DataObject
# 	private_class_method :new

	def self.load oid, tables = nil
		( tables &= self::TABLES ).collect do |table|
			attr_reader table.intern
		end if tables

		if params = $sql.execute("SELECT *
		                          FROM #{self.table_name}#{" LEFT JOIN #{self.table_name}_#{tables.join " USING (#{self.table_name}_id) LEFT JOIN #{self.table_name}_"} USING (#{self.table_name}_id)" unless tables.empty?}
		                          WHERE #{self.table_name}.#{self.table_name}_id = #{oid}").fetch then
			x = self.new oid, params
			#$stderr.puts ">>> LOAD #{x.inspect}"
			#x
		else
			raise "#{self} ##{oid} not found"
		end
	end

	private

	def self.table_name
		self.name.downcase
	end

	public

	attr_reader :oid

	def initialize oid, params = nil
		@oid = oid
	end

	def save
		##
		# Saving data to main table...
		unless ( set_clauses = editable_fields.collect do |field|
			"#{field} = #{instance_variable_get("@#{field}").quote}"
		end ).empty? then
			$sql.execute "UPDATE #{self.class.table_name}
			              SET #{set_clauses.join ', '}
			              WHERE #{self.class.table_name}_id = #{@oid}"
		end

		##
		# ...and to other tables that have been loaded.
		for table in loaded_tables do
			fields = {}; for key, value in instance_variable_get "@#{table}" do
				fields[key] = value.quote unless value.empty?
			end
			next if fields.empty?

			if $sql.execute("SELECT *
			                 FROM #{self.class.table_name}_#{table}
			                 WHERE #{self.class.table_name}_id = #{@oid}").num_rows == 0 then
				$sql.execute "INSERT INTO #{self.class.table_name}_#{table} (#{self.class.table_name}_id, #{fields.keys.join(', ')})
				              VALUES (#{@oid}, #{fields.values.join(', ')})"
			else
				$sql.execute "UPDATE #{self.class.table_name}_#{table}
				              SET #{fields.join ' = ', ', '}
				              WHERE #{self.class.table_name}_id = #{@oid}"
			end
		end
	end

	private

	def editable_fields
		( methods.grep(/\=$/).collect do |method|
			method[0..-2]
		end ) & $sql.columns(self.class.table_name)
	end

	def loaded_tables
		methods & self.class::TABLES
	end
end
