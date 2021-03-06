module RPortal
   AnonymousUser="Anonymous"
   class SQL
      def getLatestNewsItems(number)
	 getNewsItems(1,number)
      end
      
      def getNewsItems(page,page_length,state="POST")
	 page=1 if page<1
	 start=(page-1)*page_length
	 if state!="ALL" then
	    return select "SELECT TOP ? id,title,created,author,summary FROM rportal_news WHERE state=? ORDER BY created DESC",page_length,state
	 else
	    return select "SELECT TOP ? id,title,created,author,summary FROM rportal_news ORDER BY created DESC",page_length
	 end
      end
      
      
      def getNewsItem(id)
	 return select_one "SELECT id,title,created,author,summary,content FROM rportal_news WHERE id=?",id
      end
      
      def getNewsItemCommentsCount(id)
	 return select_one("SELECT count(id) FROM rportal_news_comments WHERE article_id=?",id)[0]
      end
      
      def getNewsItemComments(id)
	 return select "SELECT id,parent_id,created,author,title,content FROM rportal_news_comments WHERE article_id=?",id
      end
      
      def addNewsComment(title,author,aid,pid,time,content)
	 time||=Time.new
	 time=time.utc.tv_sec
	 transaction { |db|
	    db.do "INSERT INTO rportal_news_comments(title,created,author,article_id,parent_id,content)
	    VALUES (?,?,?,?,?,?)",title,time,author,aid,pid,content
	 }
      end
      
      def addNewsItem(title,author,time,summary,content,state="SUBMIT")
	 time=time.utc.tv_sec
	 transaction { |db|
	    db.do "INSERT into rportal_news (title,created,author,summary,content,state) VALUES (?,?,?,?,?,?)",title,time,author,summary,content,state
	    return (db.select_one "SELECT LAST_INSERT_ID() as id")['id']
	 }
      end
   end
end
