


module Radical
   
   module Handlers
      
      # Handlers ERuby files
      class ERubyHandler < RubyScriptHandler
	 
	 def initialize(*a)
	    @compiler=ERuby::Compiler.new
	    super(*a)
	 end
	 
	 def execute(request,response)
	    response.header['Content-type']="text/html"
	    super(request,response)
	 end
	 
	 def eval(str)
	    request=@request
	    response=@response
	    super(@compiler.compile_string(str))
	 end
	 
	 
	    
	 
      end
      
   end
   
end
	 
	 
	 
