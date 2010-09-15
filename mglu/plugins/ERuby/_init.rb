begin
   require 'eruby' # Attempt to load ERuby
#~ rescue LoadError => x
   #~ begin
      #~ require 'erb'
      #~ module ERuby
	 #~ class Compiler < ERB::Compiler
	    #~ alias :compile_string :compile
	    
	    #~ def initialize()
	       #~ super(nil)
	    #~ end
	    
	 #~ end
      #~ end
   rescue LoadError => x
      Radical::Log.error "You need either ERuby(C) or ERb(Ruby) module"
      raise x
   end
#~ end
