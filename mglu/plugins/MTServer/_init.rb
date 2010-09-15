begin
   require 'cMTServer'
rescue LoadError => x
   require 'MTServer'
end
