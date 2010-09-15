require 'thread'

module Radical
   
   module Handlers
      
      # Static content handler
      class CgiHandler < BaseHandler
	 include PersistentHandler
	 include DisableGPC
	 
	 class CgiError < Exception
	 end
	 
	 HeaderRGX=/^([\w-]+):\s*(.*)$/
	 
	 def initialize(params)
	    rd=params['rootdir']
	    if rd.nil?
	       Log.warn("rootdir not supplied","GeneralHandler")
	    else
	       self.rootdir=rd
	    end
	 end
	 
	 def rootdir=(r)
	    @rootdir=File.expand_path(r)
	 end
	 
	 def execute(request,response)
	    cgi_in=Tempfile.new("radical_cgiin")
	    cgi_out=Tempfile.new("radical_cgiout")
	    cgi_err=Tempfile.new("radical_cgierr")
	    cl=(request.header['Content-length']||0).to_i
	    if cl>0
	       cgi_in << request.data.read(cl)
	    end

	    Thread.critical=true
	    pid=fork
	    if pid.nil?
	       host,port=request.host.split(":")
	       uri,query=request.path.split("?")
	       ENV['SERVER_SOFTWARE']="Radical/#{RADICAL_VERSION}"
	       ENV['SERVER_NAME']=host
	       ENV['GATEWAY_INTERFACE']="CGI/1.1"
	       ENV['SERVER_PROTOCOL']=request.proto
	       ENV['SERVER_PORT']=port.to_s||80
	       ENV['REQUEST_METHOD']=request.method
	       ENV['SCRIPT_NAME']=uri
	       ENV['PATH_INFO']=""
	       ENV['QUERY_STRING']=query
	       ENV['REMOTE_ADDR']=request.ip
	       if i=request.header['Content-type']
		  ENV['CONTENT_TYPE']=i
	       end
	       ENV['CONTENT_LENGTH']=cl.to_s
	       request.header.each do |key,val|
		  ENV["HTTP_#{key.upcase.gsub('-','_')}"]=val
	       end
	       $stdout=cgi_out.__getobj__
	       $stderr=cgi_err.__getobj__
	       cgi_in.rewind
	       $stdin=cgi_in.__getobj__
	       path=request.real_uri(@rootdir).split("/")
	       file=path.pop
	       dir=path.join("/")
	       Dir.chdir dir
	       exec("./#{file}")
	    else
	       Thread.critical=false
	       Process.waitpid(pid)
	       cgi_out.rewind
	       cgi_err.rewind
	       while (line=cgi_out.gets) !~ /^(\n|\r)/
		  if line =~ HeaderRGX
		     response.header[$1] = $2.strip
		     if $1=="Status" then
			status=$2
			response.status=status.split[0].to_i
		     end
		  else
		    raise CgiError.new(cgi_err.read)
		  end
	       end
	       response << (cgi_out.read||"")
	       super(request,response)
	    end
	 end
	 
      end
      
   end
   
end

	 
	 
	 
