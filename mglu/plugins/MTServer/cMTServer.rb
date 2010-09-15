# Provides the ruby-half of the C implementation of MTServer

require 'MTServerC';
$C_RADICAL=true
Radical::Log.info("MTServerC extension loaded")
module Radical
   
   module Server
           
     class MTServer
	
	def _serve(io)
	   begin
	      serve(io)
	   rescue Exception => x
	   end
	end
	
	def _servessl(io)
	   s=Radical::SSL::SSLSocket.new(io,@ssl[1],@ssl[0])
	   begin
	      serve(s.accept)
	   rescue Exception => x
	   end
	end
	   
	def serve(io)
	end
		
	
	def stop
	   @tcpServer=nil
	end
	
	def stopped?
	   @tcpServerThread == nil
	end
	
	def _start()
	   @tcpServer=TCPServer.new(@host,@port)
	   @port=@tcpServer.addr[1]
	end
	
	def shutdown
	   @shutdown = true
	end
	
	def connections
	   @connections.size
	end
	
	attr_reader :port, :host, :maxConnections,:workers

      end
   end
   
end
