require 'thread'
require 'md5'
module Radical
   
   module Cache
      
      class MemoryCacheManager < BaseCacheManager
	 	 
	 def initialize()
	    @mem=Util::EntryCache.new 20
	 end
	 
	 def purge(request)
	    @storage.purge(request.orig_path)
	 end
	 
	 def pass(request,response)
	    return nil if request.method!="GET"
	    return nil if response.ttl==0
	    obj=response.dup
	    obj.io=nil
	    @mem["#{request.orig_path},#{request.lang}"]=[response.body,response.header,response.ttl,Time.now.tv_sec]
	 end
	 
	 def purgeAll()
	    @mem.clear
	 end
	 
	 def get(request,response)
	    return nil if request.method!="GET"
	    key="#{request.orig_path},#{request.lang}"
	    body,header,t,ttl=@mem[key]
	    return nil if body.nil?
	    if Time.now.tv_sec-(t+ttl)>0
	       @mem[key]=nil
	       nil
	    end
	    response.body=body
	    response.header=header
	    response
	 end
	 
      end      
   end
end
	    
	    
	       
	 
