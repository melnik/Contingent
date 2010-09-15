# MultiThreaded(using thread pool) TCPServer, derived from GServer.rb(which was
# written by John W. Small <jsmall@laser.net>

require "socket"
require "thread"

module Radical
   
   module Server
      
      # A worker thread class, binds to server and accepts connections
      class MTWorker
	 
	 def initialize(employer,clientnum=-1)
	    @employer=employer
	    @clientnum=clientnum
	    @run=true
#	    @thread=Thread.new &method('run').to_proc
		@thread = Thread.new { run }
	 end
	 
	 def stop()
	    @run=false
	    Thread.kill @thread
	 end
	 
	 def run()
	    while @run
	       begin
		  @employer.avail+=1
		  s=@employer.accept
		  @employer.avail-=1
		  begin
		     @employer.serve(s)
		  rescue Exception => detail
		     Log.warn(detail.message)
		  ensure
		     begin
			@clientnum-=1
			@run=false if @clientnum==0
			s.close
		     rescue
		     end
		  end
	       rescue Exception => x
		  Log.warn(x.message)
	       end
	    end
	    @employer.workers.delete(self)
	 end
      end
	 

      class MTServer
	 
	 DEFAULT_HOST = "0.0.0.0"
	
	 
	 # To be overriden
	 def serve(io)
	 end
	 
	 
	 def stop
	    Thread.kill @tcpServerMonitor
	    @workers.each do |w|
	       w.stop
	    end
	    @tcpServer=nil
	    GC.start
	 end
	 
	 def stopped?
	    @tcpServerThread == nil
	 end
	 
	 def shutdown
	    @shutdown = true
	 end
	 	 
	 def join
	    @tcpServerThread.join if @tcpServerThread
	 end
	 
	 attr_reader :port, :host, :maxConnections,:workers
	 attr_accessor :avail, :ssl
	 	 
	    	 
	 def initialize(port, host, minWorkers,maxWorkers,tempWorkers)
	    @autoclose=true
	    @avail=0
	    @m=Mutex.new
	    @tcpServerThread = nil
	    @port = port
	    @host = host
	    @workers=[]
	    @minWorkers = minWorkers.to_i
	    @maxWorkers = maxWorkers.to_i
	    @tempWorkers = tempWorkers.to_i
	 end
	 
	 # Thread safe wrapper to TCPServer#accept
	 def accept()
	    @m.synchronize do
	       s=@tcpServer.accept
	       if not @ssl.nil?
		  s=Radical::SSL::SSLSocket.new(client,@ssl[1],@ssl[0])
		  s.accept
	       end
	       return s
	    end
	 end
	 
	 def workers_count()
	    @workers.length
	 end
	 
	 def start(ssl=nil)
	    raise "running" if !stopped?
	    @ssl=ssl if ssl
	    @shutdown = false
	    @tcpServer=TCPServer.new(@port)
	    @port = @tcpServer.addr[1]
	    1.upto(@minWorkers) { @workers << MTWorker.new(self) }
	    if @maxWorkers!=-1
	       
	       @tcpServerMonitor = Thread.new {
		  while 1
		     if @avail<1
			if @workers.length<@maxWorkers
			   @workers << MTWorker.new(self,-1)
			   
			   next
			elsif @workers.length>@maxWorkers and @workers.length-@maxWorkers<@tempWorkers then
			   @workers << MTWorker.new(self,500)
			end
		     end
		     sleep(1)
		  end
	       }
	    else
	       @tcpServerThread = Thread.new {
		  begin
		     while 1
			s=@tcpServer.accept
			if not @ssl.nil?
			   s=Radical::SSL::SSLSocket.new(client,@ssl[1],@ssl[0])
			   s.accept
			end
			serve s
		     end
		     
		  end
	       }
	    end
	    
	    
	    self
	 end
	 
      end
   end
   
end
