module RPortal
   
   Bug=Struct.new :id,:product_id,:owner_id,:version,:platform,:status,:progress,:summary,:assigned
   
   class Bug
      def initialize(id=nil,sql=nil)
	 @id=id
	 @sql=sql
      end
      
      def self.fromRow(row)
	 b=Bug.new
	 row.each_with_name do |val,key|
	    b[key]=val
	 end
	 b
      end
   end
   
   class SQL
      def getLatestBugs(number)
	 getBugs(1,number)
      end
      
      def getBugs(page,page_length,filters={})
	 page=1 if page<1
	 start=(page-1)*page_length
	 if product=filters[:product]
	    wherestr="WHERE product_id=#{product}"
	 end
	 select("SELECT id,product_id,owner_id,assigned,version,platform,status,progress,summary FROM rportal_bugs #{wherestr} ORDER BY id DESC LIMIT ?,?",start,page_length).map do |row|
	    Bug.fromRow(row)
	 end
      end
      
      def getMaxBugPage(count)
	 count=count.to_f
	 d=select_one "SELECT COUNT(id) AS c FROM rportal_bugs"
	 return (d[:c]/count).ceil
      end
      
      def resolveBugStatus(id)
	 data=select_one "SELECT descr from rportal_bugs_status WHERE id=? LIMIT 1",id
	 data=data||{:descr => "Undefined"}
	 return data[:descr]
      end
      
      def assignBug(id,aid,uid)
	 transaction { |db|
	    db.do "UPDATE rportal_bugs SET assigned=? WHERE id=?",aid,id
	    addBugLog(db,id,uid,"Bug assigned to User ##{aid}");
	 }
      end
      
      def newBug(owner,product,version,platform,status,progress,summary)
	 id=nil
	 transaction do |db|
	    db.do %{
	       INSERT INTO rportal_bugs 
	       (owner_id,product_id,version,platform,status,progress,summary)
	       VALUES
	       (?,?,?,?,?,?,?)
	    },owner,product,version,platform,status,progress,summary
	    id=(db.select_one "SELECT LAST_INSERT_ID() AS id")['id']
	    addBugLog(db,id,owner,"Created")
	 end
      end
      
      def getBug(bugid)
	 Bug.fromRow(select_one %{ 
	    SELECT id,product_id,owner_id,assigned,version,platform,status,progress,summary FROM rportal_bugs r
	    WHERE r.id=?
	 },bugid)
      end
      
      def getBugComments(bugid)
	 select %{
	    SELECT c.content,c.author,c.otime,d.name FROM rportal_bug_comments c,rportal_users d 
	    WHERE c.bug_id=? and c.author=d.uid ORDER BY c.otime ASC
	 },bugid
      end
      
      def getBugLog(bugid,page=0,entries=25)
	 start=entries*page
	 select %{
	       SELECT u.name as name, l.otime as otime,l.operation as operation from rportal_bug_log l,
	       rportal_users u where l.bug_id=? and u.uid=l.user_id order by l.otime DESC LIMIT ?,?
	    },bugid,start,entries
      end
      
      def addBugLog(db,bugid,user,operation,time=nil)
	 time||=Time.now
	 db.execute %{
	    INSERT INTO rportal_bug_log
	    (bug_id,user_id,otime,operation)
	    VALUES
	    (?,?,?,?)
	 },bugid,user,time.to_i,operation
      end
      
      def addBugComment(bugid,user,content)
	 t=Time.now
	 transaction do |db|
	    db.do %{
	       INSERT INTO rportal_bug_comments
	       (bug_id,author,otime,content)
	       VALUES
	       (?,?,?,?)
	    }, bugid,user,t.to_i,content
	    addBugLog(db,bugid,user,"Add Comment",t)
	 end
      end
   end
end
