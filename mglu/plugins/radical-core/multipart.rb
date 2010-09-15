
=begin

= plugins/radical-core/multipart.rb

Copyright (C) 2003  Shugo Maeda <shugo@modruby.net>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

=end
require 'tempfile'

module Radical
   module HTTP
      
      class MultipartParser
	 attr_reader :files,:values
	 def urldecode(str)
	    return str.tr("+", " ").gsub(/((?:%[0-9a-fA-F]{2})+)/n) {
	       [$1.delete("%")].pack("H*")
	    }
	 end

	 def initialize(req,boundary)
	    reader = MultipartReader.new(req, boundary)
	    @files={}
	    @values={}
	    while !reader.eof?
	       header = reader.read_header
	       if / name="?([^\";]*)"?/n =~ header["Content-Disposition"]
		  name = $1
	       else
		  name = ""
	       end
	       if / filename="?([^\";]*)"?/n =~ header["Content-Disposition"]
		  
		  if /Mac/ni =~ req.header["User-Agent"] &&
		     /Mozilla/ni =~ req.header["User-Agent"] &&
		     /MSIE/ni !~ req.header["User-Agent"]
		     filename = urldecode(filename)
		  end
		  
		  
		  file = MultipartFile.new("radical_ufile")
		  file.binmode
		  while data = reader.read
		     file.print(data)
		  end
		  file.rewind
		  file.original_filename = filename
		  file.content_type = req.header["Content-Type"]
		  @files[name]=file
	       else
		  @values[name]=reader.read_body.sanitize
	       end
	       next
	    end
	    if filename
	    end
	 end
      end
      
      module POST
	 class MultipartParser < HTTP::MultipartParser
	 end
      end
      
      class MultipartReader
	 INITIAL_SIZE = 4 * 1024
	 EOL = "\r\n"
	 
	 HEADER_VALID_TOKEN = '[-\w!\#$%&\'*+.^_`|{}~]'
	 HEADER_REGEXP = /(#{HEADER_VALID_TOKEN}+):\s+([^#{EOL}]*)/n
	 
	 def initialize(req, boundary)
	    @req = req
	    @boundary = "--" + boundary
	    @length = @req.header["Content-Length"].to_i
	    
	    @buffer = ""
	    @chunk_size = @boundary.size > INITIAL_SIZE ?
	    @boundary.size : INITIAL_SIZE
	 end
	 
	 def read_header
	    while true
	       return {} if fill_buffer(@chunk_size)==0
	       endi = @buffer.index(EOL + EOL)
	       break if endi || @buffer.empty?
	       return {} unless @length > 0
	    end
	    header = @buffer[0 ... endi + 2]
	    @buffer[0 ... endi + 4] = ""
	    
	    result = {}
	    header.gsub!(/EOL\s+/n, "")
	    header.scan(HEADER_REGEXP) do |name, value|
	       name.gsub!(/\b\w/n) { |m| m.upcase }
	       result[name] = value
	    end
	    
	    return result
	 end
	 
	 def read_body
	    result = ""
	    while data = read
	       result.concat(data)
	    end
	    result
	 end
	 
	 def read(bytes = INITIAL_SIZE)
	    fill_buffer(bytes)
	    start = @buffer.index(@boundary)
	    case start
	    when 0
	       if @buffer.index(@boundary + "--") == 0
		  @buffer = ""
		  @length = 0
		  return nil
	       end
	       @buffer[0 ... @boundary.size + 2] = ""
	       return nil
	    when nil
	       bytes_to_return = bytes - @boundary.size - 1
	    else
	       bytes_to_return = start > bytes ? bytes : start
	    end
	    
	    chunk = @buffer[0 ... bytes_to_return]
	    @buffer[0 ... bytes_to_return] = ""
	    return start ? chunk[0 ... -2] : chunk
	 end
	 
	 def fill_buffer(bytes)
	    return 0 if @length == 0
	    bytes_to_read = bytes - @buffer.size + @boundary.size + 2
	    bytes_to_read = @length if bytes_to_read > @length
	    chunk = @req.data.read(bytes_to_read) || ""
	    @buffer.concat(chunk)
	    @length -= chunk.size
	    return chunk.size
	 end
	 
	 def eof?
	    @buffer.empty? && @length <= 0
	 end
      end
      
      class MultipartFile < Tempfile
	 attr_accessor :original_filename, :content_type
	 
	 def write_to(file)
	    if not file.kind_of? IO
	       x=File.new(file.to_s)
	    end
	    rewind
	    while (data=read(65536))
	       x << data
	    end
	    rewind
	 end
      end
   end
end
