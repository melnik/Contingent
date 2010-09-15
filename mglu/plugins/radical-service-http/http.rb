module Radical
   module Service
      class Http < Server::HttpServer
	 def initialize(handler,port,host,minWorkers,maxWorkers,tempWorkers,ssl=false)
	    super(handler,port,host,minWorkers,maxWorkers,tempWorkers)
	    @stdlog=nil
	    if ssl then
	       @ssl=[SSL.key,SSL.cert]
	    else
	       @ssl=nil
	    end
	 end
	 
	 def start(ssl=nil)
	    super(ssl)
	 end
	 
	 def restart()
	    stop()
	    start()
	 end
	 
	 def started?()
	    @run
	 end
	 
	 def status()
	    {
	       "Running" => started?,
	       "Worker Threads" => @workers.length,
	       "Minimum worker threads" => @minWorkers,
	       "Maximum worker threads" => @maxWorkers,
	       "Unoccupied threads" => avail
	    }
	 end
	 def to_s()
	    "HttpServer(Port #{@port})"
	 end
	 
      end
   end
   ServiceRegistry['http']=Proc.new do |handler,conf|
      port=conf['port']||443
      host=conf['host']||'127.0.0.1'
      min=conf['minWorkers']||5
      max=conf['maxWorkers']||20
      temp=conf['tempWorkers']||25
      s=Service::Http.new(handler,port.to_i,host,min.to_i,max.to_i,temp.to_i,false)
   end
   ServiceRegistry['http-ssl']=Proc.new do |handler,conf|
      port=conf['port']||443
      host=conf['host']||'127.0.0.1'
      min=conf['minWorkers']||5
      max=conf['maxWorkers']||20
      temp=conf['tempWorkers']||25
      s=Service::Http.new(handler,port,host,min,max,temp,true)
   end
end

