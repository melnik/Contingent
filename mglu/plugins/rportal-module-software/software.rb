module RPortal
   Platform=Struct.new (:id,:name,:descr)
   class Platform
      def self.fromRow(row)
	 p=Platform.new()
	 p.id=row[:id]
	 p.name=row[:name]
	 p.descr=row[:descr]
	 return p
      end      
   end
   
   SoftwareItem=Struct.new (:id,:name,:descr,:long_description)
   class SoftwareItem
      def self.fromRow(row,*flags)
	 p=SoftwareItem.new()
	 if row
	    p.id=row[:id]
	    p.name=row[:name]
	    p.descr=row[:descr]
	    if flags.index(:extended) then
	       p.long_description=row[:content]
	    end
	 end
	 return p
      end
      
   end
   
   class SQL
      def getSoftwareItems()
	 select("SELECT id,name,descr from rportal_software").map do |row|
	    SoftwareItem.fromRow(row)
	 end
      end
      
      def getSoftwareItem(id,*flags)
	 if flags.index(:extended) then
	    row=select_one("SELECT s.id as id,s.name as name,s.descr as descr,c.content as content from rportal_software s,rportal_software_content c where s.id=c.id and s.id=?",id)
	    if not row
	       row=select_one("SELECT id,name,descr from rportal_software WHERE id=?",id)
	       SoftwareItem.fromRow(row)
	    else
	       SoftwareItem.fromRow(row,:extended)
	    end
	 else
	    row=select_one("SELECT id,name,descr from rportal_software WHERE id=?",id)
	    SoftwareItem.fromRow(row)
	 end
      end
      
      def getPlatforms()
	 select("SELECT id,name,descr from rportal_platforms").map do |row|
	    Platform.fromRow(row)
	 end
      end
      
      def resolvePlatform(id,to_object=true)
	 data=select_one "SELECT name,descr from rportal_platforms WHERE id=? ORDER BY id DESC LIMIT 1",id
	 if to_object
	    Platform.fromRow(data)
	 else
	    return data[:name],data[:descr]
	 end
      end
      
      def resolveSoftwareItem(id)
	 data=select_one "SELECT name from rportal_software WHERE id=? ORDER BY id DESC LIMIT 1",id
	 data=data||{:name => "Unknown"}
	 return data[:name]
      end
      
      def resolveSoftwareVersion(id)
	 data=select_one "SELECT pid from rportal_software_versions WHERE id=? DESC LIMIT 1",id
	 return data[:pid]
      end
            
      def getAllSoftwareVersions()
	 return select "SELECT v.pid as id,r.name as name,v.version as version from rportal_software_versions v,rportal_software r WHERE v.pid=r.id ORDER BY name ASC"
      end
      
      def getSoftwareVersions(pid)
	 return select_all "SELECT v.pid as id,r.name as name,v.version as version from rportal_software_versions v,rportal_software r WHERE v.pid=r.id  and v.pid=? ORDER BY name ASC",pid
      end
      
      def getLatestSoftwareVersion(pid)
	 data=select_one "SELECT * from rportal_software_versions WHERE pid=? ORDER BY id DESC LIMIT 1",pid
	 return data[:version]
      end
   end
end
