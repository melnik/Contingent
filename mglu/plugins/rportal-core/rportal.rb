require 'singleton'
require 'md5'
RPortalException = Class.new Exception
module RPortal
   
   @@modules={}
   
   def self.register_module(name,&p)
      (@@modules||={})[name]=p
   end
   
   def self.modules()
      @@modules||={}
   end
   
   def self.is_loaded?(pname)
      return PluginManager.is_loaded?("rportal-module-#{pname}")
   end
      
   
   UserNameExists = Class.new RPortalException
   UserEmailExists = Class.new RPortalException
         
   class Password < String
      Chars=["_","^","%","!"]
      ("0".."9").each do |c|
	 Chars << c
      end
      ("a".."z").each do |c|
	 Chars << c
      end
      ("A".."Z").each do |c|
	 Chars << c
      end
      
      def initialize(l=8)
	 s=""
	 lht=Chars.length
	 1.upto l do |i|
	    s << Chars[rand(lht)]
	 end
	 super s
      end
   end

   class SQL < Radical::DB::DBManager
         
      def initialize(database)
	 super(database)
      end
      
      
      
   end
end
