
Radical::MasterHandler::POST_HANDLE << Proc.new do |request,response,handler|
   encodings=Radical::HTTP::AcceptParser.new(request.header['Accept-encoding'])
   if encodings.find { |enc| enc.entry=="gzip" } then
      gz=Zlib::GzipWriter.new(StringIO.new)
      gz.write response.body
      gz=gz.close
      gz.rewind
      response.body=gz.read
      response.header['content-length']=response.body.length
      response.header['content-encoding']='gzip'
   end
end
