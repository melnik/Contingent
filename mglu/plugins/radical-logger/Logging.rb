require 'thread'
module Radical
   
   module Logging
      
      class SimpleLogger
	 attr_accessor :io
	 LF="\n"
	 
	 def initialize(io=$stdout)
	    @ioqueue=Queue.new
	    if io.kind_of? String
	       io=File.new(io,"w+")
	    end
	    @io=io
	    @keep_running=true
	    @flushed=false
	    # Start the writer thread, reading from the queue
	    @iothread=Thread.new do
	       begin
		  while @keep_running
		     time,message_type,message,source=@ioqueue.pop
		     @io.write "[#{time}] #{message_type} : #{message}\n" if not message.nil?
		  end
		  begin
		     while not @ioqueue.empty?
			time,message_type,message,source=@ioqueue.pop(true)
			@io.write "[#{time}] #{message_type} : #{message}\n" if time
		     end
		  rescue ThreadError
		  end
	       ensure
		  @io.flush
		  @flushed=true
	       end
	    end
	    @iothread.priority=-5
	 end
	 
	 # Stop the writer thread
	 def stop()
	    @keep_running=false
	    @ioqueue << nil
	    if @iothread.alive?
	       while not @flushed
		  sleep 0.2
	       end
	    end
	 end
	 
	 # Report to the Logger about a web hit, flags is expected to be
	 # an array of String, potentially providing additional information
	 # about the request.
	 def hit(request,response,flags=[])
	    log("ServerHit"," #{request.ip}  #{response.status} #{request.orig_path} Method : #{request.method} [#{flags.join(',')}]")
	 end
	 
	 # Report a message in the log.
	 def log(message_type,message,source=nil)
	    if source.nil?
	       source="All"
	    end
	    @ioqueue << [Time.now,message_type,message,source] if @keep_running
	 end
	 
	 def server_error(request,response,e)
	    log("ServerError","#{e.class} -- #{e.message} #{e.backtrace.join LF}");
	 end
	 
	 def error(message,source=nil)
	    log("Error","#{message} - #{message.backtrace.join LF}");
	 end
	 
	 def fatal(message,source=nil)
	    log("Fatal",message);
	 end

	 def warn(message)
	    log("Warn",message,source=nil);
	 end
	 
	 def info(message)
	    log("Info",message,source=nil);
	 end
	 
	 def debug(message)
	    log("Debug",message,source=nil);
	 end
	 
	 
      end
      
   end
   Log=Logging::SimpleLogger.new
   
end
