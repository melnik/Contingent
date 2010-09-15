require 'cache'

module Radical
   module Handlers
      class BaseHandler
	 def _cache()
	    nil
	 end
      end
   end
end




Radical::MasterHandler::PRE_HANDLE << Proc.new do |request,response,handler|
   if cache=handler._cache and r=cache.get(request,response) then
      io=response.io
      response=r
      response.io=io
      Radical::Log.hit(request,response,['CACHE'])
      response
   else
      nil
   end
end

Radical::MasterHandler::POST_HANDLE << Proc.new do |request,response,handler|
   expire=Time.new+response.ttl
#   response.header['Expires']=Radical::HTTP::http_date(expire)
   if cache=handler._cache and response.status==200 then 
      cache.pass(request,response)
   end
end
