#
# Implements a simple HTTP-server by using John W. Small's (jsmall@laser.net) 
# ruby-generic-server.
# 
# Copyright (C) 2001 by Michael Neumann (neumann@s-direktnet.de)
#
# Modified later by Idan Sofer (idan@idanso.dyndns.org)

module Radical
   
   module Server
      
      class HttpServer < MTServer
	 
	 def initialize(handler, port, host, minWorkers,maxWorkers,tempWorkers)
	    @handler = handler
	    super(port, host, minWorkers,maxWorkers,tempWorkers)
	 end
	 
	 private
	 
	 
	 def http_header(header=nil)
	    header ||= HTTP::Table.new
	    
	    header["Connection"] = "close"
	    header["Date"]       = HTTP.http_date(Time.now)
	    
	    header
	 end

	 
	 def http_resp(status_code, status_message=nil, header=nil, body=nil)
	    status_message ||= HTTP::StatusCodeMapping[status_code]
	    
	    str = ""
	    str << "#{HTTP::HTTP_PROTO} #{status_code} #{status_message}#{HTTP::CRLF}"
	    http_header(header).writeTo(str)
	    str << HTTP::CRLF
	    str << body unless body.nil?
	    str
	 end

	 
	 # Main Serve Loop -----------------------------------------
	 
	 public
	 
	 HeaderRGX=/^([\w-]+):\s*(.*)$/
	 # Overrides MTServer#serve
	 def serve(io)
	    while not  io.closed?
	       # parse first line
	       if io.gets =~ /^(\S+)\s+(\S+)\s+(\S+)/
		  request = HTTP::Request.new(io, $1, $2, $3)
		  request.ip=io.peeraddr[3]
	       else
		  io << http_resp(400, "Bad Request") 
		  return
	       end
	       
	       # parse HTTP headers
	       
	       while (line=io.gets) !~ /^(\n|\r)/
		  if line =~ HeaderRGX
		     request.header[$1] = $2.strip
		  end
	       end
	       if request.proto=="HTTP/1.1"
		  if request.header['Host'].nil?
		     response=HTTP::Response.new(400,io,request.keepAlive?)
		     response.sendHeaders
		     response << "No host request-header given, in violation of HTTP/1.1"
		     response.close
		     return response
		  end
	       end
	       begin
		  response = HTTP::Response.new(200,io,request.keepAlive?)
		  # execute script handler
		  response=@handler.call(request, response)
		  # write response back to the client
		  if not response.jobDone then
		     response.sendHeaders
		     response << response.body
		     response.close
		  end
	       rescue Exception => e
		  Log.error(e)
		  return false
	       end
	    end
	 end
      end 
      
   end
   
end
