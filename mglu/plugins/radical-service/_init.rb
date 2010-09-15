module Radical
   ServiceRegistry={}
   Services={}
   
   def Services.start()
      each do |name,s|
	 begin
	    s.start
	    Log.info("Started service #{s}")
	 rescue Exception => x
	    Log.warn("Service #{s} raised exception #{x} while being started")
	    Log.warn(x.backtrace.join("\n"))
	 end
      end
   end      
   
   def Services.stop()
      each do |name,s|
	 begin
	    s.stop
	    Log.info("Stopped service #{s}")
	 rescue Exception => x
	    Log.warn("Service #{s} raised exception #{x} while being stopped")
	    Log.warn("Backtrace: "+x.backtrace.join("\n"))
	 end
      end
   end
	 
   
   module ServiceInterface
      def start()
	 raise NotImplementedError
      end
      
      def stop()
	 raise NotImplementedError
      end
      
      def restart()
	 stop()
	 start()
      end
      
      def started?() # Return true if service operational, otherwise false
	 false
      end
      
      def status() # Return a Hash with service specific status information
	 {}
      end
      
   end
end
