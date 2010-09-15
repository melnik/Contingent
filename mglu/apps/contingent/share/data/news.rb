require 'db'
require 'extensions'

class News
	def self.list(params, fields = [])
		$sql.execute("SELECT *
		              FROM news n LEFT JOIN user u USING (user_id)
		              ORDER BY news_date DESC").fetch do |row|
			yield *( convert_sql_result row, fields ) if block_given?
		end
	end

# 	private_class_method :new

	def self.create
		begin
			$sql.execute "INSERT INTO news (news_date) VALUES (CURDATE())"
			News.load $sql.insert_id
		rescue MysqlError
			raise "News could not be created"
		end
	end

	def self.load oid
		if params = $sql.execute("SELECT *
		                          FROM news n LEFT JOIN user u USING (user_id)
		                          WHERE news_id = #{oid}").fetch(true) then
			News.new(oid, params)
		else
			raise "News ##{oid} not found"
		end
	end

	def self.delete oid
		News.load(oid).delete
	end

	##
	# ID новости в БД
	attr_reader :oid

	##
	# Тема новости
	attr_accessor :subject

	##
	# Текст новости
	attr_accessor :body

	##
	# Дата новости
	attr_accessor :date

	def initialize oid, params = nil
		@oid = oid

		if params.is_a? Hash then
			@subject = params['n.subject']
			@body    = params['n.body']
			@date    = params['n.news_date']
		end
	end

	def save
		$sql.execute "UPDATE news
		              SET subject   = #{@subject.quote}
		                , body      = #{@body.quote}
		                , news_date = #{@date.quote}
		              WHERE news_id = #{@oid}"
	end

	def delete
		$sql.execute "DELETE FROM news WHERE news_id = #{@oid}"
	end
end
