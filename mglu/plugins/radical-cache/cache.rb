
module Radical
   
   CacheManagers={}
   
   module Cache
      
      
      # Subclass this class in order to build new cache managers(initialize should be overriden)
      class BaseCacheManager
	 
	 # Raises an exception since it's an abstract class. override initialize(and do not call super())
	 def initialize()
	    raise "Abstract class"
	 end
	 
	 class DumbRequestRecord
	    attr_reader :orig_path
	    def initialize(uri)
	       @orig_path=uri
	    end
	 end
	 
	 # Purge a URI from the cache, do not override.
	 def invalidate(uri)
	    purge(DumbRequestRecord.new(uri))
	 end
	 
	 # Return a cached copy of the requested document using a response object.
	 # Return nil if there is no cached response.
	 def get(request,response)
	    nil
	 end
	 
	 # Purge an object from the cache as described by request
	 def purge(request)
	    false
	 end
	 
	 # Purge all of the cache
	 def purgeAll()
	    false
	 end
	 
	 # Passes a request and response objects, cache them.
	 def pass(request,response)
	    nil
	 end
	 
      end
      
   end
   
end
	   
	    
