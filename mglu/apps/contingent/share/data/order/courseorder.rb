require 'data/term'

class CourseOrder < Order
	TARGET = :course
	NEEDS_FACULTY = true
	ALLOW_PARTIAL = false

	LAST_COURSE = 7

	def full?
		@attributes.include? 'course'
	end

	def term
		@term ||= Term.new date_created
	end

	def term_number
		@term_number ||= term.number @attributes['course'] if @attributes['course']
	end

	def add course
		unless full? then
			@attributes['course'] = course

			add_students rescue nil
			add_groups   rescue nil

			save
		else
			raise error, 'приказ может быть связан только с одним курсом'
		end
	end

	alias_method :<<, :add

	def add_students student_ids, paragraph_id = 0
		move student_ids, paragraph_id
	end

	def add_groups group_ids = nil
		if group_ids then
			$sql.execute "INSERT INTO order_group (order_id, group_id)
			              VALUES (#{@oid}, #{group_ids.join "), (#{@oid}, "})"
		else
			$sql.execute "INSERT INTO order_group (order_id, group_id)
			              SELECT #{@oid}, group_id
			              FROM `group` INNER JOIN department USING (department_id)
			              WHERE faculty_id = #{@faculty_id} AND current_term_number = #{term_number}"
		end
	end

	def get_student_attributes student_id
		get_attributes :student, student_id
	end

	def set_student_attributes student_id, attributes
		set_attributes :student, student_id, attributes
	end

	def get_group_attributes group_id
		get_attributes :group, group_id
	end

	def set_group_attributes group_id, attributes
		set_attributes :group, group_id, attributes
	end

	def each_student paragraph_id = :all, fields = %w( student_id last_name first_name father_name card_number group_id group )
		if paragraph_id == nil then
			student_ids = []; $sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
			                                FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
			                                WHERE student_id NOT IN (
			                                	SELECT student_id FROM order_student WHERE order_id = #{@oid}
			                                ) AND f.faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND s.student_state_id = #{Classifier::StudentState::STUDYING}
			                                ORDER BY f.short_name, d.department_num, current_term_number, g.group_num, last_name, first_name, father_name").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				student_ids << row['student_id'].to_i
			end

			return Student.list_statistics(student_ids)
		else
			super
		end
	end

	def each_group fields = %w( group_id current_term_number group_num group )
		$sql.execute("SELECT *
		              FROM order_group og RIGHT JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
		              WHERE og.order_id = #{@oid}
		              ORDER BY f.short_name, d.department_num, current_term_number, g.group_num").fetch do |row|
			yield *( convert_sql_result row, fields ) if block_given?
		end
	end

	def delete
		try_to_modify; remove :student; remove :group; super
	end

	def remove_students student_ids
		remove :student, student_ids
	end

	private

	def remove_groups group_ids
		remove :group, group_ids
	end

	def try_to_activate
		##
		# Проверка номера курса
		unless @attributes['course'].in? 1..LAST_COURSE then
			if @auto_fix then
				delete
			else
				raise error(:activation, false), 'неверный номер курса'
			end
		end

		##
		# Проверка студентов

		# Формируется список студентов,
		# которые должны быть в приказе, но их там нет
		student_ids = []; $sql.execute("SELECT *
		                                FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id)
		                                WHERE student_id NOT IN (
		                                	SELECT student_id FROM order_student WHERE order_id = #{@oid}
		                                ) AND d.faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND s.student_state_id = #{Classifier::StudentState::STUDYING}").fetch do |row|
			student_ids << row['student_id'].to_i
		end

		unless student_ids.empty? or self.class::ALLOW_PARTIAL then
			if @auto_fix then
				add_students student_ids rescue nil
			else
				raise error(:activation, true, { 'student_ids' => student_ids }), 'следующие студенты должны присутствовать в приказе'
			end
		end

		# Формируется список студентов,
		# которых не должно быть в приказе, но они там есть
		student_ids = []; $sql.execute("SELECT *
		                                FROM order_student os LEFT JOIN student s USING (student_id) LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id)
		                                WHERE order_id = #{@oid} AND NOT (faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND s.student_state_id = #{Classifier::StudentState::STUDYING})").fetch do |row|
			student_ids << row['student_id'].to_i
		end

		unless student_ids.empty? then
			if @auto_fix then
				remove_students student_ids
			else
				raise error(:activation, false, { 'student_ids' => student_ids }), 'следующие студенты не должны присутствовать в приказе'
			end
		end

		##
		# Проверка групп

		# Формируется список групп,
		# которые должны быть в приказе, но их там нет
		group_ids = []; $sql.execute("SELECT *
		                              FROM `group` g INNER JOIN department d USING (department_id)
		                              WHERE group_id NOT IN (
		                              	SELECT group_id FROM order_group WHERE order_id = #{@oid}
		                              ) AND d.faculty_id = #{@faculty_id} AND current_term_number = #{term_number}").fetch do |row|
			group_ids << row['group_id'].to_i
		end

		unless group_ids.empty? then
			if @auto_fix then
				add_groups group_ids rescue nil
			else
				raise error(:activation, false, { 'group_ids' => group_ids }), 'следующие группы должны присутствовать в приказе'
			end
		end

		# Формируется список групп,
		# которых не должно быть в приказе, но они там есть
		group_ids = []; $sql.execute("SELECT *
		                              FROM order_group og LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id)
		                              WHERE order_id = #{@oid} AND NOT (faculty_id = #{@faculty_id} AND current_term_number = #{term_number})").fetch do |row|
			group_ids << row['group_id'].to_i
		end

		unless group_ids.empty? then
			if @auto_fix then
				remove_groups group_ids
			else
				raise error(:activation, false, { 'group_ids' => group_ids }), 'следующие группы не должны присутствовать в приказе'
			end
		end

		super
	end
end
