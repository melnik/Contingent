class GlobalStudentsOrder < StudentsOrder
private
	def search_available where_clauses, fields = %w( student_id last_name first_name father_name card_number group_id group )
		where_clauses << "(f.faculty_id = #{@faculty_id} OR f.faculty_id IS NULL)" if @faculty_id.to_i > 0

		student_ids = []; $sql.execute("SELECT *, s.category AS s_category, f.category AS f_category
		                                FROM student s LEFT JOIN `group` g USING (group_id) LEFT JOIN department d USING (department_id) LEFT JOIN faculty f USING (faculty_id)
		                                WHERE student_id NOT IN (SELECT student_id FROM order_student WHERE order_id = #{@oid}) AND #{where_clauses.join ' AND '}
		                                ORDER BY f.short_name, d.department_num, current_term_number, g.group_num, last_name, first_name, father_name").fetch do |row|
			yield *( convert_sql_result row, fields ) if block_given?

			student_ids << row['student_id'].to_i
		end

		return Student.list_statistics(student_ids)
	end

end