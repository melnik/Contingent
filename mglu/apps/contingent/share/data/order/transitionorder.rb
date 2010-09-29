require 'data/order/courseorder'

require 'soap-client/session'

class TransitionOrder < CourseOrder
	TYPE = 'Переводной приказ'
	PARAGRAPH_NAME = [ 'Без задолженностей', 'С задолженностями', 'В академ. отпуске', 'На стажировке' ]

	ALLOW_PARTIAL = true

	AFFECTED_ATTRIBUTES = {
		:student => %w( group_id liabilities scholarship_id ),
	}

	MARK_TYPES = {
		:bad  => [
			'50058c22-980f-11dc-81bb-000e0c433c0a', # Перенос
			'79a7a474-980f-11dc-81bb-000e0c433c0a', # Перенос
			'ca0a9db3-9810-11dc-81bb-000e0c433c0a', # Перенос
			'421520fb-9811-11dc-81bb-000e0c433c0a', # Перенос
			'48ad8977-9811-11dc-81bb-000e0c433c0a', # Недопуск кафедры
			'4c127cf1-9811-11dc-81bb-000e0c433c0a', # Недопуск кафедры
			'4eff99fc-9811-11dc-81bb-000e0c433c0a', # Недопуск кафедры
			'51f30f35-9811-11dc-81bb-000e0c433c0a', # Недопуск кафедры
			'61616036-9811-11dc-81bb-000e0c433c0a', # Недопуск деканата
			'6667e5af-9811-11dc-81bb-000e0c433c0a', # Недопуск деканата
			'68f4fb48-9811-11dc-81bb-000e0c433c0a', # Недопуск деканата
			'6b37dfe2-9811-11dc-81bb-000e0c433c0a', # Недопуск деканата
			'6d98d0cb-9811-11dc-81bb-000e0c433c0a', # Неявка
			'72710700-9811-11dc-81bb-000e0c433c0a', # Неявка
			'74e6d418-9811-11dc-81bb-000e0c433c0a', # Неявка
			'7717472d-9811-11dc-81bb-000e0c433c0a', # Неявка
			'81618ce6-9811-11dc-81bb-000e0c433c0a', # Не зачтено
			'7a9c274c-9811-11dc-81bb-000e0c433c0a', # Неудовлетворительно
			'83ab781d-9811-11dc-81bb-000e0c433c0a', # Неудовлетворительно
			'8631591e-9811-11dc-81bb-000e0c433c0a', # Неудовлетворительно
		],
		:good => [
			'8b2cd30d-9811-11dc-81bb-000e0c433c0a', # Зачтено
			'88bd0d8f-9811-11dc-81bb-000e0c433c0a', # Удовлетворительно
			'8dcd6250-9811-11dc-81bb-000e0c433c0a', # Удовлетворительно
			'9087a970-9811-11dc-81bb-000e0c433c0a', # Удовлетворительно
			'9325451e-9811-11dc-81bb-000e0c433c0a', # Хорошо
			'955afdd1-9811-11dc-81bb-000e0c433c0a', # Хорошо
			'986377dc-9811-11dc-81bb-000e0c433c0a', # Хорошо
			'9ade3f94-9811-11dc-81bb-000e0c433c0a', # Отлично
			'9dad2de5-9811-11dc-81bb-000e0c433c0a', # Отлично
			'9fdc5206-9811-11dc-81bb-000e0c433c0a', # Отлично
		],
	}

	public_class_method :new

	private :rollback_student # приказ не может быть отменен
	#avfix: since no web service in available, restored capability of moving students
	#private :move # приказ сам распределяет студентов по параграфам

	def term
		# 3 first months of a new term acts as at previous one
		@term ||= Term.new date_created - 3*30
	end

	def search_available params = {}
		$sql.execute("SELECT DISTINCT FLOOR(current_term_number/2+0.5) AS course
		              FROM `group` INNER JOIN department USING (department_id)
		              WHERE faculty_id = #{@faculty_id} AND current_term_number < #{LAST_COURSE * 2}
		              ORDER BY course").fetch do |row|
			yield row['course'].to_i
		end
	end

	def add_students student_ids = nil, paragraph_id = nil
		## avfix: Disabled web service usage.

		return super

		unless student_ids then
			student_ids = []; $sql.execute("SELECT student_id
			                                FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id)
			                                WHERE faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND student_state_id = #{Classifier::StudentState::STUDYING}").fetch do |row|
				student_ids << row['student_id'].to_i
			end
		end

		for student in [ SessionPortType.new.listMarks(ListMarksRequest.new(student_ids.collect do |student_id|
			student_id.to_uuid :student
		end)).response ].flatten do
			student_id = student.guid.to_id[:id]

			excuse, deadline = 'неуважительная', nil

			liabilities = student.marks.collect do |exam|
#				# FIXME: student-wide attributes
#				if exam.methods.include? 'sessionDelay' then
#					excuse, deadline = 'уважительная', exam.sessionDelay.to_d
#				end
#
				if exam.mark.guid.in? MARK_TYPES[:bad] then
					{
						:subject => exam.subject.name.utf_decode,
						:type    => exam.testType.name.utf_decode,
					}
				end
			end.compact rescue []

			paragraph_id, attributes = if liabilities.empty? then
				[ 0, nil ]
			else
				[ 1, {
					:excuse      => excuse,
					:deadline    => deadline,
					:liabilities => liabilities,
				} ]
			end

			$sql.execute "INSERT INTO order_student (order_id, student_id, paragraph_id, attributes)
			              VALUES (#{@oid}, #{student_id}, #{paragraph_id}, #{attributes.quote})" rescue next
		end
	end

	def add_groups group_ids = nil
		super

		each_group %w(group_id department_id department current_term_number group_num) do |group_id, department_id, department, term_number, group_number|
			next if group_ids and not group_id.in? group_ids

			set_group_attributes group_id, {
				:next_id => begin # TODO: ask external service
					Group.load "#{department}-#{term_number+1}-#{group_number}"
				rescue
					$sql.execute "INSERT INTO `group` (department_id, current_term_number, group_num)
					              VALUES (#{department_id}, #{term_number+1}, #{group_number})"
					retry
				end.oid
			}
		end
	end

	def each_student paragraph_id = :all, fields = %w( student_id last_name first_name father_name card_number group_id group )
		student_ids = []; case paragraph_id
		when 2 then # в академ. отпуске
			$sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
			              FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
			              WHERE f.faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND s.student_state_id = #{Classifier::StudentState::VACATION}
			              ORDER BY f.short_name, d.department_num, current_term_number, g.group_num, last_name, first_name, father_name").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				student_ids << row['student_id'].to_i
			end
		when 3 then # на стажировке
			$sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
			              FROM student s INNER JOIN `group` g USING (group_id) INNER JOIN department d USING (department_id) INNER JOIN faculty f USING (faculty_id)
			              WHERE f.faculty_id = #{@faculty_id} AND current_term_number = #{term_number} AND s.student_state_id = #{Classifier::StudentState::TRAINEE}
			              ORDER BY f.short_name, d.department_num, current_term_number, g.group_num, last_name, first_name, father_name").fetch do |row|
				yield *( convert_sql_result row, fields ) if block_given?

				student_ids << row['student_id'].to_i
			end
		else return super
		end

		return Student.list_statistics(student_ids)
	end

	private

	def _activate
		super

		each_group %w(group_id attributes) do |group_id, attributes|
			set :student, { :group_id => attributes['next_id'] }, "group_id = #{group_id}"

			student_ids = []
			each_student 2, %w(student_id group_id) do |sid, gid| student_ids << sid if gid == group_id end
			each_student 3, %w(student_id group_id) do |sid, gid| student_ids << sid if gid == group_id end
			$sql.execute "UPDATE student
			              SET group_id = #{attributes['next_id']}
			              WHERE student_id IN (#{student_ids.join ', '})" if student_ids.any?
		end

		set :student, { 'liabilities' => true }, 'paragraph_id = 1'
		set :student, { 'scholarship_id' => nil }
	end

	def _rollback
		raise # TODO

		super
	end

	def try_to_activate
		super
	end
end
