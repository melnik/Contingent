class VirtualStudentsOrder < Order
	TARGET = :virtual
	NEEDS_FACULTY = true

	def initialize oid, params = nil
		super

		( @attributes ||= {} )['students'] ||= []
	end

	private :rollback_student # приказ не может быть отменен

	def add student_params, paragraph_id = nil
		try_to_modify

		@attributes['students'] << (student_params | { 'paragraph_id' => paragraph_id })

		sort!; save
	end

	alias_method :<<, :add

	def move student_ids, paragraph_id
		try_to_modify

		if self.class::PARAGRAPH_NAME[paragraph_id] then
			for student_id in student_ids do
				@attributes['students'][student_id]['paragraph_id'] = paragraph_id
			end
		else
			raise error, "в приказе нет параграфа #{paragraph_id + 1}"
		end

		sort!; save
	end

	def remove student_ids
		try_to_modify

		if student_ids == :all then
			@attributes['students'].clear
		else
			for student_id in student_ids.sort.reverse do
				@attributes['students'].delete_at student_id
			end
		end

		save
	end

	def get_student_attributes student_id
		if @status == Classifier::OrderStatus::ACTIVATED then
			get_attributes :student, student_id
		else
			{
				'card_number' => Date.today.year.to_s[2, 2] + Classifier::Faculty[@faculty_id][:letter] + ('%03d' % ((@attributes['card_number_first'] || 1) + student_id)),
			} | @attributes['students'][student_id]
		end
	end

	def set_student_attributes student_id, attributes
		try_to_modify

		need_sorting = true if @attributes['students'][student_id]['group_id'] != attributes['group_id']
		need_sorting = true if @attributes['students'][student_id]['name']     != attributes['name']

		@attributes['students'][student_id] = attributes

		sort! if need_sorting; save
	end

	def get_student student_id, tables = nil
		if @attributes['students'][student_id] then
			Student.new student_id, get_student_attributes(student_id) # TODO: fix field convertion.
		end
	end

	def each_student paragraph_id = :all, fields = %w( student_id last_name first_name father_name card_number group_id group )
		if @status == Classifier::OrderStatus::ACTIVATED or @students_created then # BlackFix
			super
		else
			@attributes['students'].each_with_index do |student, id|
				if paragraph_id.in? [ student['paragraph_id'].to_i, :all ] then
					student = get_student_attributes(id) # BlackFix: apply virtual fields first
					row = student & %w( gender_id card_number group_id dormitory birth_date citizenship_id paragraph_id ) | {
						'student_id'  => id,
						'last_name'   => student['name']['last'],
						'first_name'  => student['name']['first'],
						'father_name' => student['name']['father'],
						'attributes'  => student.to_xml,
					}

					if student['group_id'] and not ( %w( group course department faculty ) & fields ).empty? then # TODO: fix field list
						row |= $sql.execute("SELECT *
						                     FROM `group` g LEFT JOIN department d USING (department_id) LEFT JOIN faculty f USING (faculty_id)
						                     WHERE group_id = #{student['group_id']}").fetch
					end

					yield *( convert_sql_result row, fields ) if block_given?
				end
			end

			return { :total => @attributes['students'].size }
		end
	end

	def delete
		try_to_modify; super
	end

	def fix
		sort!; save
	end

	private

	def _activate
		super

		each_student :all, %w( student_id paragraph_id attributes ) do |student_id, paragraph_id, attributes|
			$sql.execute "INSERT INTO student (student_status_id)
			              VALUES (#{Classifier::StudentStatus::STUDENT})"

			attributes.delete 'paragraph_id'

			$sql.execute "INSERT INTO order_student (order_id, student_id, paragraph_id, attributes)
			              VALUES (#{@oid}, #{$sql.insert_id}, #{paragraph_id.quote}, #{attributes.quote})"
		end

		@students_created = true # ugly hack
	end

	def _rollback
		$sql.execute "DELETE student, order_student
		              FROM student INNER JOIN order_student USING (student_id)
		              WHERE order_id = #{@oid}"

		@students_created = false # ugly hack

		super
	end

	def commit_activation
		@attributes.delete 'students'; save

		super
	end

	def sort!
		@attributes['students'].each_with_index do |student, i|
			# GreyCat: 20060818: we had orders with broken groups; one
			# can't save the order to fix broken groups, as order gets sort!
			# and crashes while saving only 1 person while others have broken
			# groups. Thus this rescue block was added.
			begin
				@attributes['students'][i]['group_name'] = Group.load(student['group_id']).name.gsub(/(\D)(\d-)/, '\10\2') if student['group_id']
			rescue RuntimeError
				@attributes['students'][i]['group_name'] = '-'
			end
		end

		@attributes['students'].sort! do |a, b|
			"#{a['group_name']} #{a['name']['last']} #{a['name']['first']} #{a['name']['father']}".utf_encode <=> "#{b['group_name']} #{b['name']['last']} #{b['name']['first']} #{b['name']['father']}".utf_encode
		end

		@attributes['students'].each_index do |i|
			@attributes['students'][i].delete 'group_name'
		end
	end
end
