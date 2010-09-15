

module Radical
   
   
   @@onshutdown=[]
   @@shutdown_mutex=Mutex.new
   @@shutdown_done=false
   def self.registerShutdown(&oper)
      @@onshutdown << oper
   end
   
   def self.shutdown()
      @@shutdown_mutex.synchronize do
	 return if @@shutdown_done
	 Log.info("Radical shutting down")
	 @@onshutdown.each do |p|
	    p.call
	 end
	 Log.stop
	 @@shutdown_done=true
      end
   end
   
   def self.wait()
      while not @@shutdown_done
	 sleep 1
      end
   end
   
   HandlersList={}
   module Handlers
      Mimetypes={}
      def Mimetypes.[]=(key,value)
	 Radical::HandlerManager[Radical::HandlerManager::Selectors::FileExt.new("^#{key}$")]=value
      end
      DefaultHandler=nil
      
      # Handlers including this module state no GPC processing should occur,
      # perhaps because the module has it's own mechanism and we wish to avoid
      # duplicate work(such as radical-handler-cgi)
      module DisableGPC 
      end
      
      module PersistentHandler
	 def self.append_features(mod)
	    super
	    def mod.new_handler(params={})
	       n=self.new(params)
	       n.params=params
	       n
	    end
	    
	    
	 end
	 
	 def handler_class()
	    self.class
	 end
	 
	 def params()
	    @_params
	 end
	 
	 def params=(par)
	    @_params=par
	 end
	 
	 def initialize(params)
	 end
	 
      end
      
      module PerSessionHandler
	 def self.append_features(mod)
	    super
	    def mod.new_handler(params={})
	       x=Class.new self
	       x.params=params
	       x
	    end
	    
	    def mod.params()
	       @params
	    end
	    
	    def mod.params=(par)
	       @params=par
	    end
	 end
	 
	 def handler_class()
	    self.class
	 end
	    
	 
      end
      
      # It is highly recommended that all handlers inherit this class and override #execute
      class BaseHandler
	 attr_accessor :_cache
	 
	 
	 
	 def self.quick_handler(request,response,status,body,content_type="text/plain")
	    response.status=status
	    response.body=body
	    response.header['Content-type']=content_type
	    response.header['Content-length']=response.body.length
	 end	    
	 
	 def _execute(request,response)
	    begin
	       execute(request,response)
	    rescue Exception => e
	       Log.server_error(request,response,e)
	       execute_error(request,response,e)
	    end
	 end
	 	 
	 def execute(request,response)
	    response.header['Content-length']=response.body.length
	    if not request.lang.nil? then
	       response.header['Vary']="Accept-Language"
	       response.header["Content-Language"]=request.lang
	    end
	 end
	 
	 def self._execute(request,response)
	    self.class().new()._execute(request,response)
	 end
	 def self.execute(request,response)
	    self.class().new().execute(request,response)
	 end
	 
	 def execute_error(request,response,exception)
	    self.class.execute_error(request,response,exception)
	 end
	 
	 def self.execute_error(request,response,exception)
	    response.status=500
	    response.body=""
	    response.header['Content-type']='text/plain'
	    response << "An Error was occured. Exception was raised: #{exception.class} (#{exception.message})\n "
	    response << "Please notify the web admin\n"
	    response << exception.backtrace.join("\n")
	    response.header['Content-length']=response.body.length
	    return response
	 end

	 
      end
      
   end
   
   
   class MasterHandler
      PRE_GPC=[]
      PRE_HANDLE=[]
      POST_HANDLE=[]
      
      
      
      def call(request,response)
	 # Pre-GPC(Get/Post/Cookies) stage - pass control to filters
	 PRE_GPC.each do |mod|
	    mod.call(request,response)
	 end
	 
	 if handler=Radical::HandlerManager.match(request);
	    # Now begin parsing GPC data, unless process disabled by handler
	    if not handler.handler_class.included_modules.include? Handlers::DisableGPC
	       request.parse_get;
	       request.parse_cookies
	       if request.method=="POST"
		  request.parse_post();
	       end
	    end
	    # Pre-handlers stage, some filters might wish to bind here
	    # Allow them to interrupt the process cycle here and provide
	    # their own response object
	    PRE_HANDLE.each do |mod|
	       res=mod.call(request,response,handler)
	       return res if not res.nil?
	    end
	    # Call proper handler
	    res=handler._execute(request,response)
	    if res.kind_of? Radical::HTTP::Response
	       response=res
	    end
	    response.body="" if request.method=="HEAD"
	    
	    # Call post handler filters
	    POST_HANDLE.each do |mod|
	       mod.call(request,response,handler)
	    end
	 else
	    Radical::Handlers::BaseHandler.quick_handler(request,response,200,"No site configured on this address")
	 end
	 
	 Log.hit(request,response)
	 return response
      rescue Exception => e
	 Log.server_error(request,response,e)
	 Radical::Handlers::BaseHandler.execute_error(request,response,e)
      end
      
   end
   
end
   
	    	    
