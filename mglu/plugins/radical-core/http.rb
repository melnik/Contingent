require 'cgi'

# Return the file extension of _filename_
def File.getExt(filename)
   fn=filename.split("/").last||""
   fn=fn.split(".")
   fn.shift
   fn.last||""
end

module Radical
   module HTTP
      
      
      # An entry in Accept-* request header fields
      class AcceptEntry
	 include Comparable
	 attr_accessor :entry,:quality
	 def initialize(entry,quality)
	    @entry=entry
	    @quality=quality
	 end
	 
	 
	 def <=>(other)
	    return quality==other.quality
	 end
	 
	 def to_s()
	    "#{entry};q=#{quality}"
	 end
      end
      
      class AcceptParser < Array
	 def initialize(str)
	    str.split(',').each do |l|
	       l=~/\s*([a-zA-Z\/\-\*]+)?(;q=([0-1])\.([0-9]+))?/
	       self << construct($1,"$3.$4".to_f)
	    end
	 end
	 
	 def construct(value,quality)
	    AcceptEntry.new(value,quality)
	 end
	 
      end
      
      class Language < AcceptEntry
	 attr_accessor :prime,:sub
	 
	 def initialize(prime,sub="",quality=nil)
	    @prime=prime
	    @sub=sub
	    @quality=quality||1
	 end
	 
	 def code()
	    if sub
	       "#{@prime}-#{@sub}"
	    else
	       "#{prime}"
	    end
	 end
	 
	 def entry()
	    code
	 end	 
      end
      
      class LangArray < AcceptParser
	 
	 def construct(value,quality)
	    prime,sub=value.split "-"
	    Language.new(prime,sub,quality)
	 end
	 
	 
	 def negotiate(avail)
	    sort!
	    reverse!
	    each do |lang|
	       if (idx=avail.index(lang.code)) or (idx=avail.index(lang.prime))
		  return avail[idx]
	       end
	    end
	 end
      end
      
      def self.http_date( aTime )
	 # Michael Nuemann deserve the credit for this one
	 # It's much faster then the one provided by the cgi module
	 aTime.gmtime.strftime( "%a, %d %b %Y %H:%M:%S GMT" )
      end
      CRLF        = "\r\n"
      HTTP_PROTO  = "HTTP/1.1"
      SERVER_NAME = "Radical HttpServer (Ruby #{RUBY_VERSION})"
      
      
      ##
      # Mapping of status code and error message
      #
      StatusCodeMapping = {
	 200 => "OK",
	 400 => "Bad Request",
	 405 => "Method Not Allowed",
	 411 => "Length Required",
	 500 => "Internal Server Error"
      }
      
      
      class QueryParser < Hash
	 # Parses HTTP Queries, initiate with a query string and have all the
	 # results in a hash
	 attr_reader :query
	 
	 ParseRegexp=/&(?=[\w\W]+?=)/
	 
	 # Attempt to fetch key first, convert key to symbol if nil
	 def [](key)
	    super(key)||super(key.to_s.intern)
	 end
	 
	 def initialize(query)
	    @query=query
	    super();
	    if not query.nil?
	       values=[]
	       values=query.split(ParseRegexp)
	       values.each_with_index(&method('addValue').to_proc);
	    end 
	 end
	 
	 private
	 def addValue(str,i)
	    key,value=str.split("=");
	    if value.nil? 
	       self[key]=""
	       return
	    end
	    value.gsub!(/([^\\])\+/,'\1 ');
	    value.gsub!(/\\([%+])/,'\1')
	    value.gsub!(/%([0-9a-fA-F]{2})/)  { |match| $1.downcase.hex.chr}
# <fix>
#	    # Escape all HTML from GPC, make no assumptions about it's safety
#	    value.to_html!
#
#	    if value.=~("^[0-9]+$") then
#	       value=eval("value=#{value}");
#	    end 
# </fix>
	    
	    sym=key.intern
	    # Allow submissions with duplicate keys using arrays, modified code of ralf dot horstmann at webwasher.com
	    if prev=self[sym]
	       if prev.kind_of? Array
		  prev << value
	       else
		  self[sym]=[prev,value]
	       end
	    else
	       self[sym]=value;
	    end
	 end
	 
      end
      
      module POST
	 
	 class QueryParser < HTTP::QueryParser
	 end
      end
      
      module GET
	 
	 class URIQueryParser < HTTP::QueryParser
	    # Query that seperates the URL from the query string
	    
	    attr_reader :uri
	    
	    def initialize(uri)
	       uri,query=uri.split("?");
	       @uri=uri
	       super(query)
	    end
	    
	    
	 end
	 
      end
      
      module Cookies
	 
	 class CookieParser < Hash
	    
	    def initialize(str)
	       super()
	       vals=str.split /;\s+/
	       for val in vals
		  k,v=val.split "="
		  self[k]=v.to_html if not v.nil?
	       end
	       
	    end
	    
	 end
	 
	 # Generates a cookie string(used with Set-Cookie header)
	 def self.CookieWriter(k,v,expire=Time.now+3600,path="/")
	    expire=CGI::rfc1123_date(expire)
	    "#{k}=#{v}; path=#{path}; expires=#{expire}"
	 end
	 
      end    
      
      class Request
	 attr_reader :data, :header, :method, :path, :proto, :host, :uri
	 attr_accessor :ip
	 attr_reader :get_values, :post_values, :files, :real_uri, :cookies
	 
	 def initialize(data, method=nil, path=nil, proto=nil)
	    @ip="0.0.0.0"
	    @get_values={}
	    @post_values={}
	    @files={}
	    @header, @data = Table.new, data
	    @method, @path, @proto = method, path, proto
	    @_uri=path.split("?")[0]
	    remap_off
	    @orig_path=@path.clone
	 end
	 
	 # Should we keepalive?
	 def keepAlive?()
	    if @proto=="HTTP/1.1" and @header['Connection']!="close"
	       return true
	    else
	       return @header['Connection']=="Keep-Alive"
	    end
	 end
	 
	 def content_length
	    len = @header['Content-Length']
	    return nil if len.nil?
	    return len.to_i 
	 end
	 
	 def remap=(prefix)
	    @remap=prefix
	 end
	 
	 def remap_on()
	    @uri=@_uri.clone
	    @uri[remap]=''
	    @uri="/#{@uri}"
	 end
	 
	 def remap_off()
	    @uri=@_uri
	 end
	 
	 def remap()
	    @remap||="/"
	 end
	 
	 def full_uri()
	    @_uri
	 end
	 
	 def real_uri(rootpath)
	    apath=File.expand_path rootpath+@uri
	    if @uri=~/\/$/ then
	       apath+="/"
	    end
	    if apath.index(rootpath)==0 then
	       apath
	    else
	       raise "Attempt to view non-public files"
	    end
	 end
	 
	 
	 def fileext()
	    @fileext||=File.getExt(@uri)
	 end
	 
	 def orig_path()
	    @orig_path
	 end
	 
	 def langlist()
	    if @langlist.nil?
	       @langlist=LangArray.new(header['Accept-Language']||'en')	       
	    end
	    @langlist
	 end
	 
	 def lang=(l)
	    @lang=l
	 end
	 
	 def lang()
	    if @lang.nil? and not @disableML then
	       if @lang=langlist().first
		  @lang=@lang.code
	       else
		  @lang="en"
	       end
	    end
	    @lang
	 end
	 
	 # Disable multi-language
	 def disableML()
	    @lang="en"
	    @disableML=true
	 end
	 
	 def host()
	    @host||=header['Host']
	 end
	 	 
	 def parse_get()
	    urip=HTTP::GET::URIQueryParser.new(path)
	    @get_values=urip
	 end
	 
	 def parse_post()
	    if header['Content-type']=="application/x-www-form-urlencoded" then
	       query=HTTP::POST::QueryParser.new(@data.read(@header['Content-length'].to_i))
	       @post_values=query;	       
	    elsif header['Content-type']=~ /\Amultipart\/form-data.*boundary=\"?([^\";,]+)\"?/
	       parser=HTTP::POST::MultipartParser.new(self,$1)
	       @post_values=parser.values;
	       @files=parser.files;
	    end
	 end
	 
	 def parse_cookies()
	    cookie=@header['Cookie']
	    @cookies=(cookie && HTTP::Cookies::CookieParser.new(cookie))||{}
	 end
	 
      end
      
      #Check C version of Response and Table can be loaded, they are somewhat faster,
      #but less readable<grin>
      #
      #If not, define the pure ruby class
      begin
	 require 'httpC'
	 Radical::Log.info("http C extension loaded")
      rescue LoadError
	 class Response
	    attr_reader   :headersSent, :jobDone
	    attr_accessor :body, :status, :status_message, :io,:header,:proto
	    
	    
	    def initialize(status=200,port=nil,keepAlive=false,is_cgi=false)
	       @status_message=""
	       @proto="HTTP/1.1"
	       @keepAlive=keepAlive
	       @jobDone=false
	       @headersSent=false
	       @io=port
	       @body=""
	       @status = status
	       @is_cgi=is_cgi
	       @header = Table.new
	    end
	    
	    def reset()
	       @headersSent=false
	       @jobDone=false
	    end
	    
	    # Send headers and flush output buffer
	    def sendHeaders()
	       return false if @headersSent
	       buf=""
	       if not @is_cgi
		  buf << "#{@proto} #{status} #{status_message}\r\n"
	       else
		  header['status']="#{status} #{status_message}"
	       end
	       @header['Server']=SERVER_NAME
	       if @keepAlive then
		  @header["Connection"] = "Keep-Alive"
	       else
		  @header["Connection"] = "close"
	       end
	       @header["Date"]       = HTTP.http_date(Time.now)
	       header.writeTo(buf)
	       buf << CRLF
	       @io << buf
	       @headersSent=true
	       true	    
	    end
	    
	    # Output data into the buffer(if sendHeaders not called yet), or
	    # directly to the socket
	    def <<(data)
	       if @headersSent then
		  @io << data
	       else @body+=data
	       end
	    end
	    
	    # flush the socket
	    def flush()
	       @io.flush
	    end
	    
	    # Set a cookie, see HTTP::Cookies.CookieWriter
	    def setCookie(*p)
	       @header.addMultiple "Set-Cookie",HTTP::Cookies::CookieWriter(*p)
	    end
	    
	    attr_writer :ttl
	    
	    def ttl()
	       @ttl||10
	    end
	    
	    
	    def close()
	       @io.flush
	       @io.close if not @keepAlive
	       @jobDone=true
	    end
	    
	    
	 end
	 
	 
	 
	 ##
	 # a case-insensitive Hash class for HTTP header
	 #
	 class Table < Hash
	    attr_reader :multiple
	    
	    def initialize()
	       @multiple=[]
	    end
	    
	    def remove(key)
	       delete(key)
	    end
	    
	    def addMultiple(key,value)
	       @multiple.push [key,value]
	    end
	    
	    def [](key)
	       super key.capitalize
	    end
	    
	    def []=(key,val)
	       super key.capitalize,val
	    end
	    
	    def writeTo(port)
	       each { |k,v| port << "#{k}: #{v}\r\n"}
	       @multiple.each {|v|  port << "#{v[0]}: #{v[1]}\r\n"} if @multiple.length>0
	    end
	    
	 end # class Table
      end
      
		# These methods are written in pure ruby, and were not rewritten in the C version.
		class Response
			def redirect(url)
				@header['Location']=url
				@status=302
				raise Radical::Handlers::RubyScriptHandler::ScriptQuit
			end

			# Set a cookie, see HTTP::Cookies.CookieWriter
			def setCookie(*p)
				@header.addMultiple "Set-Cookie",HTTP::Cookies::CookieWriter(*p)
			end
		end
	end
end
   
require 'multipart'
