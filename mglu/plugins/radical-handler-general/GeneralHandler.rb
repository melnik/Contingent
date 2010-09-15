require 'thread'

module Radical
	module Handlers
		# Static content handler
		class GeneralHandler < BaseHandler
			include PersistentHandler
			include DisableGPC
			BUFSIZE=65536
			MAXCACHE=1024*120
			CACHESIZE=25
			TTL=30

			def initialize(params)
				rd=params['rootdir']
				if rd.nil?
					Log.warn("rootdir not supplied","GeneralHandler")
				else
					self.rootdir=rd
				end
				@cache=Util::EntryCache.new CACHESIZE
			end
	
			def rootdir=(r)
				 @rootdir=File.expand_path(r)
			end

			def execute(request,response)
				request.disableML
				response.ttl=TTL
				uri=request.real_uri(@rootdir)
				begin
					stat=File::Stat.new(uri)
					if stat.directory?
						uri += '/' if not uri[-1] == 47 	# Evil hack
						if File.exists? uri+'.redirect'
							File.open(uri+'.redirect') { |f|
								begin
									response.redirect(f.gets)
								rescue Radical::Handlers::RubyScriptHandler::ScriptQuit => e
									# Do nothing...
									super(request, response)
								end
							}
							return
						else
							uri += 'index.html'
						end
					end
					stat=File::Stat.new(uri)
					response.header['Content-type']=mime_type=Radical::Mimetypes[uri]
					size=stat.size
					response.header['Content-length']=size
					f=File.new(uri)
					f.binmode
					while size>0
						size-=BUFSIZE
						response << f.sysread(BUFSIZE)
					end
				rescue File::Errno::ENOENT => e
					response.status=404
					response.status_message="File not found."
					response.body="File not found."
					super(request,response)
				end
			end
		end
	end   
end
