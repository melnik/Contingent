require 'net/http'
Net::HTTP.version_1_2

module Radical
   module Handlers
      class ProxyHandler < BaseHandler
	 include PersistentHandler
	 include DisableGPC
	 
	 def initialize(conf)
	    @host=conf['host']
	    @port=(conf['port']||80).to_i
	    @root_uri=conf['root_uri']||""
	 end
	 
	 def execute(request,response)
	    request.remap_on
	    headers=request.header.clone
	    headers['Host']=@host
	    #Check if there was a query string in the URI
	    if query=request.get_values.query
	       uri=@root_uri+request.uri+"?"+request.get_values.query
	    else
	       uri=@root_uri+request.uri
	    end
	    res=nil
	    Net::HTTP.start(@host,@port) do |http|
	       if request.method=="GET"
		  res=http.get(uri,headers)
	       elsif request.method=="POST"
		  # FIXME: POST is currently broken
		  res=http.post(uri,"",headers)
	       end
	    end
	    res.each do |key,value|
	       response.header[key]=value
	    end
	    response.status=res.code
	    response.body<< res.body
	    super(request,response)
	 end
      end
   end
end
	       
	       
	       
	    
