# This file rewrites FCGI::UNIX so it can set permissions

class FCGI
   class UNIX
      def initialize(sockname,perm=0644)
	 @server = UNIXServer.open(sockname)
	 File.chmod(perm,sockname)
	 super()
      end
   end
end
