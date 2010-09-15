class OrderOrder < Order
	TARGET = :order
	NEEDS_FACULTY = false

	def initialize oid, params = nil
		super

		@order = Order.load @attributes['order_id'] if full?
	end

	def full?
		@attributes.include? 'order_id'
	end

	def add order_id
		unless full? then
			@order = Order.load @attributes['order_id'] = order_id; save
		else
			raise error, 'приказ может быть связан только с одним приказом'
		end
	end

	alias_method :<<, :add

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
			student_ids = []; $sql.execute("SELECT *
			                                FROM order_student os INNER JOIN student s USING (student_id) LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id) LEFT JOIN faculty f USING (faculty_id)
			                                WHERE s.student_id NOT IN (
								SELECT student_id FROM order_student WHERE order_id = #{@oid}
							) AND os.order_id = #{@attributes['order_id']}
			                                ORDER BY f.short_name, d.department_num, current_term_number, g.group_num, last_name, first_name, father_name").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				student_ids << row['student_id'].to_i
			end

			return Student.list_statistics(student_ids)
		else
			super
		end
	end

	def delete
		try_to_modify; remove :student; remove :group; super
	end

	def add_students student_ids, paragraph_id = 0
		move student_ids, paragraph_id
	end

	def remove_students student_ids
		remove :student, student_ids
	end

	private

	def try_to_activate
		##
		# Проверка ссылки на приказ
		unless full? then
			if @auto_fix then
				delete
			else
				raise error(:activation, false), 'нет ссылки на приказ'
			end
		end

		##
		# Проверка студентов

		# Формируется список студентов,
		# которых не должно быть в приказе, но они там есть
		student_ids = []; $sql.execute("SELECT *
		                                FROM order_student os LEFT JOIN (
		                                	`order` o INNER JOIN order_student tos USING (order_id)
		                                ) USING (student_id)
		                                WHERE os.order_id = #{@oid} AND o.order_id = #{@attributes['order_id']} AND tos.order_id IS NULL").fetch do |row|
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
		# которых не должно быть в приказе, но они там есть
		group_ids = []; $sql.execute("SELECT *
		                              FROM order_group og LEFT JOIN (
		                              	`order` o INNER JOIN order_group tog USING (order_id)
		                              ) USING (group_id)
		                              WHERE og.order_id = #{@oid} AND o.order_id = #{@attributes['order_id']} AND tog.order_id IS NULL").fetch do |row|
			group_ids << row['group_id'].to_i
		end

		unless group_ids.empty? then
			if @auto_fix then
				remove :group, group_ids
			else
				raise error(:activation, false, { 'group_ids' => group_ids }), 'следующие группы не должны присутствовать в приказе'
			end
		end

		super
	end
end
