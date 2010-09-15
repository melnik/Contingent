require 'thread'
require 'md5'
module Radical
   
   module Cache
      
      
      class StorageManager
	 
	 def initialize(cache_dir)
	    @cache_dir=cache_dir;
	    @wr_lock=Mutex.new
	 end
	 
	 def put(uri,obj,lang="en")
	    @wr_lock.lock
	    hsh=MD5.new(uri)
	    f=File.new("#{@cache_dir}/#{hsh}_#{lang}.tmp","w")
	    obj=obj.dup
	    obj.io=nil
	    Marshal.dump obj, f
	    f.close
	    @wr_lock.unlock
	    begin
	       File.rename("#{@cache_dir}/#{hsh}_#{lang}.tmp","#{@cache_dir}/#{hsh}_#{lang}")
	    rescue SystemCallError
	    end
	 end
	 
	 def get(uri,lang="en")
	    hsh=MD5.new(uri)
	    begin
	       x=Marshal.load File.new("#{@cache_dir}/#{hsh}_#{lang}","r")
	       return x
	    rescue File::Errno::ENOENT => x
	       nil
	    end
	 end
	 
	 def mtime(uri,lang)
	    hsh=MD5.new(uri)
	    begin
	       File.mtime("#{@cache_dir}/#{hsh}_#{lang}")
	    rescue Exception
	       nil   
	    end
	 end
	 
	 def purge(uri,lang=nil)
	    hsh=MD5.new(uri)
	    entries=Dir.new("#{@cache_dir}").entries
	    entries.collect! { |x| "#{@cache_dir}/#{x}" if x=~ "#{hsh}"}
	    entries.compact!
	    begin
	       for entry in entries
		  File.unlink(entry)
	       end
	    rescue Exception => x
	       nil   
	    end
	 end
	 
	 def purgeAll()
	    files=Dir.entries("#{@cache_dir}")
	    files.delete(".");
	    files.delete("..");
	    files.each { |x| File.unlink("#{@cache_dir}/#{x}"); }
	 end
	 
	 
      end
      
      # Storage Cache Manager, stores cached entries on disk
      class StorageCacheManager < BaseCacheManager
	 
	 Cache_Dir="cache"
	 
	 def initialize()
	    @storage=StorageManager.new(Cache_Dir)
	 end
	 
	 def purge(request)
	    @storage.purge(request.orig_path)
	 end
	 
	 def pass(request,response)
	    return nil if request.method!="GET"
	    return nil if response.ttl==0
	    return nil if request.orig_path=~/\?/
	    purge(request)
	    @storage.put(request.orig_path,response,request.lang)
	 end
	 
	 def purgeAll()
	    @storage.purgeAll
	 end
	 	 
	 def get(request,response)
	    return nil if request.method!="GET"
	    return nil if not res=@storage.get(request.orig_path,request.lang)
	    mtime=@storage.mtime(request.orig_path,request.lang)
	    if request.header['If-Modified-Since']
	       ims=parse_date(request.header['If-Modified-Since'])
	       if mtime<=ims
		  toret=response
		  toret.body=""
		  toret.status=304
		  return toret
	       end
	    end
	    return nil if mtime+res.ttl<Time.now 
	    res
	 end
	 
      end      
   end
end
	    
	    
	       
	 
