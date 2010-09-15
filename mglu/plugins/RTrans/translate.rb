require 'thread'
if not $plugin_loader_active
   require 'entryCache'
end


# Copied from mkdir.rb from : http://homepage1.nifty.com/~tetsu/ruby/cmd/mkdir.html
# Couldn't understand the japanese though;-)
def Dir.multi_mkdir(mpath)
   path=''
   mpath.split('/').each do |f|
      path.concat f
      Dir.mkdir(path) unless path == ''|| File.exists?(path)
      path.concat '/'
   end
end

module Radical
   
   # Radical has an internal I8N engine to be used by the template engine,
   # but can be used for other purposes, it has a simple syntax, and the
   # I8N files can be modified and will be automaticly reloaded, so translation
   # strings can be updated on-the-fly
   #
   # This is quite unlike gettext which was designed for C/C++ which are far less
   # dynamic and flexible:-), and follows the static write->compile->run cycle.
   # 
   # I think this module will be also useful outside Radical, so feel free to,
   # it's GPL'ed.
   #
   # I8N files are stored on the same path as the template, it inherits it's name
   # but with a suffix of _{lang}.intl, where {lang} is the requested language.
   #
   # If a requested string is not found it is added to the I8N file, so the
   # translator will have easy time translating it.
   #
   # == Syntax
   #
   # The syntax is very very simple, it's just a sequence of:
   #
   # **********
   #
   # Source string
   #
   # ++++++++++
   #
   # translation
   #
   module Translations
      
      # Used for dumping translations into the I8N file
      class TranslationWriter < File
	 
	 # Overrides File#initialize and opens the file in append mode
	 def initialize(fn)
	    super(fn,"a+")
	 end
	 
	 # Add a translation string(trg) for (src)
	 def add(src,trg)
	    return if src.nil? or trg.nil?
	    return if src==""
	    self << "**********\n#{src}\n++++++++++\n#{trg}\n"
	    flush
	 end
	 
      end
      
      # A subclass of hash which feeds itself from I8N file, it does not
      # reload itself automaticly, that is done by TranslationLoader
      #
      # You should not use this class directly.
      class TranslationTable < Hash
	 
	 # Parse the specified I8N stream (fn), should be an IO object
	 def initialize(fn)
	    @load_mutex=Mutex.new
	    @filename=fn
	    reload
	 end
	 
	 # Reload and reparse the I8N file manually
	 def reload()
	    @load_mutex.lock
	    begin
	       @writer=TranslationWriter.new(@filename)
	       fn=File.new(@filename,"r");
	    rescue Exception => e
	       self.clear
	       @load_mutex.unlock
	       return
	    end
	    self.clear
	    state=0
	    src=nil
	    trg=nil
	    fn.each_line do |line|
	       if line.strip=="*"*10
		  self[src.chop]=trg.chop if state==2		     
		  state=1
		  src=""
	       elsif
		  line.strip=="+"*10
		  state=2
		  trg=""
	       else
		  if state==1
		     src+=line
		  end
		  if state==2
		     trg+=line
		  end
	       end
	    end
	    self[src.chop]=trg.chop if state==2		     
	    @load_mutex.unlock
	 end
	 
	 
	 def [](str)
	    @load_mutex.lock
	    toret=super
	    if toret.nil? then
	       if not @writer.nil? then
		  @writer.add(str,str)
	       end
	       self[str]=str
	       @load_mutex.unlock
	       str
	    else
	       @load_mutex.unlock
	       toret
	    end
	 end
      end
      
      # Translation Loader, use this to load translations
      class TranslationLoader
	 
	 CACHE_SIZE=50
	 
	 attr_accessor :intl_dir
	 
	 # intl_dir = I8N files top directory
	 def initialize(intl_dir="",dirstruct=1)
	    @dirstruct=dirstruct
	    @intl_dir=intl_dir
	    @load_mutex=Mutex.new
	    @domains=Util::EntryCache.new(CACHE_SIZE)
	 end
	 
	 # Provide a TranslationTable object for the specified *lang*
	 # in *domain* (which is the I8N database, like 'myapp' or 'myprojects/myapp'
         #
	 # Don't reuse the returned object if possible, but recall #[] , since
	 # it will check if the I8N file was modified and refresh it, otherwise
	 # returning a cached copy
	 def [](lang,domain)
	    if @dirstruct>=1
	       fn="#{@intl_dir}/#{lang}/#{domain}.intl"
	    else
	       fn="#{@intl_dir}/#{domain}_#{lang}.intl"
	    end
	    @load_mutex.lock
	    cache,cmtime=@domains[fn]
	    if cmtime.nil? then
	       dir=fn.split '/'
	       dir.pop
	       dir=dir.join '/'
	       Dir.multi_mkdir dir
	       toret=TranslationTable.new(fn);
	       begin
		  mtime=File.mtime(fn);
	       rescue Exception
		  mtime=Time.now
	       end
		  
	       @domains[fn]=[toret,mtime]
	       @load_mutex.unlock	    
	       toret
	    else	
	       begin
		  mtime=File.mtime(fn);
	       rescue Exception
		  mtime=cmtime
		  cache.reload
	       end
	       if mtime>cmtime then
		  cache.reload
		  begin
		     mtime=File.mtime(fn)
		  rescue Exception
		  end
		  @domains[fn]=[cache,mtime]
		  @load_mutex.unlock
		  cache
	       else
		  @load_mutex.unlock
		  cache
	       end
	    end
	 end
	 
      end
   end
end
	    
	    
	    
	       
	       
