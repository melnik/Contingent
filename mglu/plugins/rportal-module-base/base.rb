module RPortal
   
   User=Struct.new(:uid,:password,:name,:grp,:last_visit,:level,:timezone,:lang,:email,:prefs)
   class User
      def initialize(uid,sql=nil)
	 @uid=uid
	 @sql=sql
	 @prefs={}
      end
      
      def register()
	 @sql.registerUser(name,password,email,level,timezone,lang)
      end
      
      def validate()
	 @sql.validateUser(name,password)
      end
      
      def in_grp?(grp)
	 @sql.isUserOf(uid,grp)
      end
   end
   class SQL
      def registerUser(name,password,email,level=0,timezone=0,lang="en")
	 password=(Digest::MD5.md5 password).to_s
	 raise MalformedEmail if not email =~ /\w+@\w+/
	 transaction {|db|
	    d=db.execute "SELECT * FROM rportal_users where name=? or email=?",name,email
	    if (row=d.fetch_hash)
	       raise UserNameExists if row['user']=name
	       raise UserEmailExists if row['email']=email
	    end
	    db.do "INSERT INTO rportal_users (password,level,name,email,timezone,lang)
	    VALUES (?,?,?,?,?,?)",password,level,name,email,timezone,lang
	 }
      end
            
      def validateUser(name,password)
	 md5=(Digest::MD5.md5 password).to_s
	 d=select "SELECT uid FROM rportal_users WHERE name=? AND password=?",name,md5.to_s
	 if (d=d.fetch_hash)
	    return d['uid']
	 else
	    return false
	 end
      end
      
      def getGroupInfo(gid)
	 if gid.kind_of? Numeric
	    select_one "select id,name,level from rportal_groups where name=?",gid
	 else
	    select_one "select id,name,level from rportal_groups where id=?",gid
	 end
      end
      
      def getUserInfo(uid)
	 if uid.kind_of? Numeric
	    if data=(@users||={})[uid]
	       return data
	    else
	       return Hash.new if uid.to_i<=0
	       d=select_one "select  u.uid as uid,u.name as name,u.password as password,u.grp as grp,u.last_visit as last_visit,GREATEST(g.level,u.level) as level,u.timezone as timezone,u.lang as lang, u.email as email from rportal_users u,rportal_groups g where u.grp=g.id and u.uid=?",uid
	       if not d.nil?
		  obj=User.new(uid,self)
		  @users[uid]=obj
	       end
	    end
	 else
	    d=select_one "select  u.uid as uid,u.name as name,u.password as password,u.grp as grp,u.last_visit as last_visit,GREATEST(g.level,u.level) as level,u.timezone as timezone,u.lang as lang, u.email as email from rportal_users u,rportal_groups g where u.grp=g.id and u.name=?",uid
	 end
	 if not d.nil?
	    obj.name=d[:name]
	    obj.grp=d[:grp]
	    obj.last_visit=d[:last_visit]
	    obj.level=d[:level].to_i
	    obj.timezone=obj.timezone
	    obj.lang=obj.lang
	    obj.email=obj.email
	    return obj.clone
	 else
	    return User.new(uid,self)
	 end
      end
      
      def isUserOf(uid,gid)
	 user=getUserInfo(uid)
	 group=getGroupInfo(gid)
	 user.level>=group.level
      end
      
      def getUsersBetweenLevel(lmin,lmax)
	    select_all("select  u.uid as uid,u.name as name,u.password as password,u.grp as grp,u.last_visit as last_visit,GREATEST(g.level,u.level) as level,u.timezone as timezone,u.lang as lang, u.email as email from rportal_users u,rportal_groups g where u.grp=g.id and GREATEST(g.level,u.level)>=? and GREATEST(g.level,u.level)<=?",lmin,lmax)
      end			 
      
      def clearUserCache(uid=nil)
	 if uid
	    (@users||={})[uid]=nil
	 else
	    @users=Hash.new
	 end
      end
   end
end
