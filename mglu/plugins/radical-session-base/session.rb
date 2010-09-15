require 'md5'
require 'singleton'

module Radical
   
   module Session
      
      SESSION_STRING="RadicalSession"
      SESSION_TIME=86400
      
      @@managers={}
      
      def self.getManager(name=nil)
	  	SessionManager.instance
      end

	class Session < Hash
		def initialize(sid)
			super()
			@sid = sid
		end
		
		def self.initialize
		end
	end
            
      # The session manager is providing cookie based session data management.
      # This is an abstract class and in order to be functional a subclass implementing
      # #[] and #[]= must be implemented
      class SessionManager
	 include Singleton
	 
	 def initialize
	 	@sessions = {}
		Session.initialize
	 end
	 
	 def session(request,response)
	    if request.cookies[SESSION_STRING].nil?
	       t=Time.new
	       id=MD5.md5("#{t.to_i} #{t.tv_usec}")
	       response.setCookie(SESSION_STRING,id,t+SESSION_TIME)
	    else
	       id=request.cookies[SESSION_STRING]
	    end
	    @sessions[id]=Session.new(id) if @sessions[id].nil?
	    @sessions[id]
	 end
	 
	 def end_session(request,response)
	    if not request.cookies[SESSION_STRING].nil?
	       id=request.cookies[SESSION_STRING]
	       response.setCookie(SESSION_STRING,"")
		   @sessions[id].clear unless @sessions[id].nil?
	       @sessions.delete_key(id)
	    end
	 end
      end
   end
end
