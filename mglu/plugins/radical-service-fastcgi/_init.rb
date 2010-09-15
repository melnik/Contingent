require 'fcgi_fix'

module Radical
	module Service
		class FastCGI
		  
			def initialize(handler,socket_type,addr,port=0)
				@handler=handler
				if not ['UNIX','TCP'].index(socket_type)
					raise "Unknown socket type #{socket_type}"
				end
				@socket_type,@addr,@port = socket_type,addr,port
			end
			
			def start()
				# Start the server thread
				@server_thread=Thread.new do
					begin
						# Check which socket type should we use, UNIX or TCP
						if @socket_type=="UNIX"
							File.unlink(@addr) if File.exists?(@addr)
							server=FCGI::UNIX.new(@addr)
						end
						if @socket_type=="TCP"
							server=FCGI::TCP.new(@addr,@port)
						end
						# Begin server loop
						while req=server.accept
							env=req.env
							request=HTTP::Request.new(req.in,env['REQUEST_METHOD'],env['REQUEST_URI'],env['SERVER_PROTOCOL'])
							request.ip=env['REMOTE_ADDR']
							request.header['Content-Type']=env['CONTENT_TYPE']
							request.header['Content-length']=env['CONTENT_LENGTH']
							# Extract all headers from the FastCGI enviroment
							env.each do |key,val|
								if key=~/^HTTP_(.*)$/
									request.header[$1]=val
								end
							end
							response=HTTP::Response.new(200,req.out,request.keepAlive?,true)
							
							begin
								response=@handler.call(request,response)
							rescue Exception => e
								response << e.to_s
							end
							
							if not response.jobDone
								response.sendHeaders
								req.out << response.body
								req.finish
							end
						end
					rescue Exception => err
						Log.error(err)
					end
				end
				
			end
			
			def stop()
				# Kill the server thread
				@server_thread.kill
				# Remove the UNIX socket
				if @socket_type=="UNIX" then
					File.unlink @addr
				end
			end
			
			def restart()
				stop()
				start()
			end
			
			def started?()
				@server_thread.alive?
			end
			
			def status()
				{
					"Running" => started?,
				}
			end
			def to_s()
				"FastCGI #{@socket_type} #{@addr} #{@port}"
			end
			
		end
	end
	ServiceRegistry['fastcgi']=Proc.new do |handler,conf|
		type=conf['socketType']||"UNIX"
		addr=conf['address']||'/tmp/radical_fastcgi'
		if type!="UNIX"
			port=(conf['port']||0).to_i
		else
			port=conf['perm']||0
			if port.kind_of? String
				port=port.oct
			end
		end
		Service::FastCGI.new(handler,type,addr,port)
	end
end
