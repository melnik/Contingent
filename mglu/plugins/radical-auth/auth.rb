require 'base64'
require 'singleton'

module Radical
   Authenticators={}
   module Auth
      ALL=1
      ALL_USERS=2
      NONE=3
      
      
      class AuthSource
	 
	 # Override this method
	 def auth(realm,user,password)
	    false
	 end
	 
	 def http_auth(realm,request,response,allowed)
	    return true if allowed==ALL
	    if allowed==NONE
	       response.status=403
	       return false
	    end
	    if not request.header['Authorization'].nil?
	       a=request.header['Authorization'].strip.split(' ')
	       user,pass=decode64(a[1]).split(":")
	       if allowed==ALL_USERS or allowed.to_a.index(user)
		  ar=nil
		  return ar if (ar=auth(realm,user,pass))!=false
	       end
	    end
	    response.status=401
	    response.header['WWW-Authenticate']="Basic realm='#{realm}'"
	    return false
	 end
      end
      
      AuthSources=Hash.new
   end
end
