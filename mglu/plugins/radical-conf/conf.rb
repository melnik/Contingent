begin
   require 'rexml/document'
rescue LoadError => x
   raise "REXML Is not installed on this system"
end
$conf_file||="#{Dir.getwd}/cfg/radical.xml"
module Radical
   Conf=REXML::Document.new(File.new($conf_file).read)
end
