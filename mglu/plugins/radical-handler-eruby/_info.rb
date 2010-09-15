DESCRIPTION="Radical ERubyScript handler"
VERSION=0.7
AUTHOR="Idan Sofer"
LICENCE=Licence::GPL
depends_on("Ruby","0.6.7",ATLEAST)
depends_on("ERuby")
depends_on("radical-core","0.7",ATLEAST)
depends_on("radical-handler-ruby") 
define('radical_handler_class','Radical::Handlers::ERubyHandler')
