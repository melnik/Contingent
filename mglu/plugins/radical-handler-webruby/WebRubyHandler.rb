module Radical
   
   module Handlers
      
      # This handler serves dynamic content from Ruby scripts(.rb extension)
      # Each script has request and response objects to deal with, as well as
      # other facilities available from Radical
      class WebRubyScriptHandler < RubyScriptHandler
	 
	 def initialize()
	    Thread.current[:session_vars]={}
	    super
	 end
	 
	 def tmpl_session_vars()
	    Thread.current[:session_vars]
	 end
	 
	 # To be called from the scripts to extract session information
	 def session()
	    (@session||=Radical::Session.getManager()).session(@request,@response)
	 end
	 
	 # End current session(user logouts)
	 def stop_session()
	    @session.end_session(@request,@response)
	 end
	 
	 # Wrapper around the authentication manager
	 def auth(realm,allowed=Auth::NONE,source="default")
	    Auth::AuthSources[source].http_auth(realm,@request,@response,allowed)
	 end
	 	 
	 # Return [name] template, initiated with the Hash [vars]
	 def template(name,*args)
	    Radical::Templating::TemplateManager[name, File.expand_path(self.class.params['tmpldir']) ,@request.lang,*args]
	 end
	 
      end
      
   end
   
end

	 
	 
	 
