module Radical
   
	module Handlers
      
		# This handler serves dynamic content from Ruby scripts(.rb extension)
		# Each script has request and response objects to deal with, as well as
		# other facilities available from Radical
		class RubyScriptHandler < BaseHandler
	  
			alias :original_require :require
  
			include PerSessionHandler
	 
			class ScriptError < Exception
			end
			
			class ScriptQuit < Exception
			end

	 # A shared hash for all RubyScriptHandlers, should be used
	 # as a hack for state-awareness, but it might be removed in the future.
	 PData=Hash.new

	 attr_reader :request, :response

	 @@cache=Util::EntryCache.new 25

	 # Shortcuts for request attributes
	 def get_values()
	    @request.get_values
	 end
	 
	 def post_values()
	    @request.post_values
	 end
	 
	 def files()
	    @request.files
	 end
	 
	 def initialize()
	    @outbuf=""
	 end
	 
	 def error_notfound()
	    response.header['Content-type']="text/plain"
	    response.status=404
	    response.status_message="File not found"
	    response.body="Requested script not found"
	 end
	 
	 def error_script(e)
	    raise e
	 end
	 	 
	 def execute(request,response)
	    response.header['Content-type']='text/html; charset=utf-8'
		
		# Eliminate caching
		response.header['Expires'] = 'Mon, 29 Jul 1997 05:00:00 GMT'
		response.header['Last-Modified'] = Time.now.gmtime.strftime('%a, %d %b %Y %H:%M:%S GMT')
		response.header.addMultiple 'Cache-Control', 'no-store, no-cache, must-revalidate'
		response.header.addMultiple 'Cache-Control', 'post-check=0, pre-check=0'
		response.header.addMultiple 'Pragma', 'no-cache'
		
	    @request=request
	    @response=response
	    response.body="";
		
		rootdir = File.expand_path self.class.params['rootdir']	
	    fn=request.real_uri(rootdir)
	    if fn=~/\/$/ then
	       fn+="index"
	    end
	    fileext=request.fileext
	    if not fileext=="rb"
	       if fileext=="" then
		  fn+=".rb"
	       else
		  fn.gsub!(Regexp.new(".#{fileext}$"),".rb")
	       end
	    end
	    begin
	       cmtime=File.mtime fn
	       mtime,proc=@@cache[fn]||[cmtime-1,nil]
	    rescue File::Errno::ENOENT
	       error_notfound	
	       super(request,response)
	       return
	    end
		
		if cmtime>mtime
			begin
				scr=File.new(fn).read
			rescue File::Errno::ENOENT
				error_notfound
				super(request,response)
				return
			end
		   
			# HACK: This might be reimplemented some day...
			load_paths = ($: + self.class.params['load_path'].split(':')).collect { |path| File.expand_path(path) + '/' }

			# av: we have to patch require a bit...
			m = 	"	def require(mod)
							exts = if mod =~ /\\.[^\\/]*$/ then [''] else ['.rb', '.so'] end
							# p \"\#{mod} was required\"
							exts.each { |ext|
								if $\".find { |x| x == (mod+ext) }
									# p \"Module already included\"
									return
								end
							}
							success = false
							[#{load_paths.collect{ |x| "'#{x}'" }.join(', ')}].each { |path|
								exts.each { |ext|
									fn = path + mod + ext
									# p \"Looking for \#{fn}\"
									if (hm = $\".find { |m| m == fn })
										# p \"Module already included (\#{hm})\"
										return
									end
									next unless File.exists?(fn) and File.file?(fn)
									# p \"Trying to load \#{fn}\"
									original_require fn
									success = true
									$\" << (mod+ext)
									# p \"\#{mod} was found at \#{fn}\"
									break
								}
								break if success
							}
							# p \"Cannot load \#{mod}\" unless success
							raise \"Cannot find module '\#{mod\}'\" unless success
						end"
						
			# Log.warn m
													
			eval m, $global_context, 'require', 0
			eval "module Kernel\n#{m}\nend\n", $global_context, 'require', 0
			eval m, binding, 'require', 0
		
			proc = eval "Proc.new {
					request = @request
					response = @response
					#{scr}
				}", binding, fn, 0
			@@cache[fn]=[cmtime,proc]

				end

				begin
					instance_eval &proc
				rescue ScriptQuit
					# do nothing - script successfully finished with redirect

					# avfix: this corrutps exception backtrace
				# rescue Exception => e
				#	error_script(e)
				end

				Thread.critical=true
				response.body+=@outbuf
				Thread.critical=false
				super(request,response)
			end
	 
			# Prints to @outbuf
			def print(str)
				@outbuf+=str.to_s
			end

			def puts(str)
				@outbuf+="#{str.inspect}\n"
			end

			# Alias to  :print
			alias_method :<<, :print
		end
	end
end
