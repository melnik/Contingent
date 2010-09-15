DESCRIPTION="Extends Radical RubyScript handler, adds support for templates, sessions, authentication etc.."
VERSION=0.7
AUTHOR="Idan Sofer"
LICENCE=Licence::GPL
depends_on("Ruby","0.6.7",ATLEAST)
depends_on("radical-handler-ruby","0.7",ATLEAST)
depends_on("radical-templating","0.7",ATLEAST)
depends_on("radical-session","0.7",ATLEAST)
depends_on("radical-auth","0.7",ATLEAST)
depends_on("RTrans","1.01",ATLEAST)
define('radical_handler_class','Radical::Handlers::WebRubyScriptHandler')
