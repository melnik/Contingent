module Radical
   
   module HandlerManager
      @@handlers=[]
      
      def self.handlers()
	 @@handlers
      end
      
      def self.handlers=(var)
	 @@handlers=var
      end
      
      def self.handlers_list()
	 list=[]
	 proc=Proc.new do |rule,obj|
	    if obj.kind_of? Array
	       obj.each &proc
	    else
	       list << obj
	    end
	 end
	 @@handlers.each &proc
	 list
      end

      module Selectors
	 
	 module Selector
	    
	    attr_accessor :remap
	    
	    
	    def to_s()
	       "Selector"
	    end
	 end
	 
	 class Default
	    include Selector
	    def =~(r)
	       0
	    end
	    
	    def to_s()
	       "Always matches"
	    end
	 end
	 
	 class FileExt < Regexp
	    include Selector
	    def =~(request)
	       super(request.fileext)
	    end
	    
	    def to_s()
	       "File extension - #{source}"
	    end
	 end
	 
	 class VirtualHost < Regexp
	    include Selector
	    
	    def initialize(*a)
	       @remap=true
	       super(*a)
	    end
	    
	    def =~(request)
	       remap=true
	       if host=request.host
		  super(host)
	       else
		  false
	       end
	    end
	    
	 end
	 
	 class Uri < Regexp
	    include Selector
	    
	    def initialize(uri,remap=false)
	       @remap=remap
	       super(uri)
	    end
	    
	    def =~(request)
	       super(request.path)
	    end
	    
	    def match(request)
	       super(request.path)
	    end
	    
	    def to_s()
	       "URL Mount - #{source}"
	    end

	 end
	 
      end
      
      @@cache=Util::EntryCache.new(10)
      class << self
	 
	 
	 def []=(selector,obj)
	    @@handlers << [selector,obj]
	 end
	 
	 def method_missing(m,*p)
	    @@handlers.method(m).call(*p)
	 end
	 
	 def each(&a)
	    @@handlers.each(&a)
	 end
	 
	 def table
	    @@handlers
	 end
	 
	 def match(request)
	    x,remap=@@cache[request.path+request.host]
	    if x.nil?
	       x=match_(request,@@handlers)
	       @@cache[request.path+request.host]=[x,request.remap]
	    else
	       request.remap=remap
	       request.remap_on
	    end
	    if x.class==Class
	       return x.new
	    end
	    x
	 end
	 
	 def match_(request,handlers,uri="/")
	    handlers.each do |rule,obj|
	       if rule=~request then
		  if rule.kind_of? Selectors::Uri
		     uri=rule.match(request)[0]
		     request.remap=uri
		     if rule.remap
			request.remap_on
		     end
		  end
		  if obj.class==Array
		     obj=match_(request,obj,uri)
		     if not obj
			next
		     else
			return obj
		     end
		  else
		     return obj
		  end
	       end
	    end
	    return false
	 end
      end
   end
end
