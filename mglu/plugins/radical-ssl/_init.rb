begin
   require 'openssl'
   require 'ssl'
rescue LoadError => x
   puts "OpenSSL extension was not found, SSL dependent functions will fail"
end
