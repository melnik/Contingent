require 'data/order/studentsorder'

class GroupCreationOrder < Order
	TYPE = 'О создании группы'
	PARAGRAPH_NAME = [ 'В приказе' ]

	TARGET = nil
	NEEDS_FACULTY = true

	public_class_method :new

	def delete
		try_to_modify; super
	end

	private
	def _activate
		super

		attributes['groups'].each { |group|

			group['name'] =~ /^([^\d]+)(\d+)-(\d+)-(\d+)$/
			faculty, department, term, num = $1, $2.to_i, $3.to_i, $4.to_i

			dep = $sql.execute("SELECT  department_id
			                    FROM    department d
			                            INNER JOIN faculty f USING (faculty_id)
			                    WHERE   f.short_name = #{faculty.quote}
			                            AND d.department_num = #{department.quote}").fetch_hash['department_id'].to_i
			$sql.execute "INSERT INTO `group` (department_id, current_term_number, group_num)
			              VALUES (#{dep.quote}, #{term.quote}, #{num.quote})"
		}

	end

	def try_to_activate
		super
		attributes['groups'].each { |group|

			group = group['name']
			raise error(:activation, true), "Неправильное название группы: #{group}" unless group =~ /^([^\d]+)(\d+)-(\d+)-(\d+)$/
			faculty, department, term, num = $1, $2.to_i, $3.to_i, $4.to_i

			# OMG... how do I find a department?

			$sql.execute("SELECT  *
			              FROM    `group` g
			                      INNER JOIN department d USING (department_id)
			                      INNER JOIN faculty f USING (faculty_id)
			              WHERE   f.short_name = #{faculty.quote}
			                      AND d.department_num = #{department.quote}
			                      AND g.current_term_number = #{term.quote}
			                      AND g.group_num = #{num}").fetch do |row|

				raise error(:activation, true), "Группа #{group} уже существует"
			end

			unless $sql.execute("SELECT  *
			                     FROM    department d
			                             INNER JOIN faculty f USING (faculty_id)
			                     WHERE   f.short_name = #{faculty.quote}
			                             AND d.department_num = #{department.quote}").fetch

				raise error(:activation, true), "Кафедра #{faculty}#{department} не существует"
			end
		}
	end
end
