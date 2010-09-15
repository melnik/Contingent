DESCRIPTION="Handler for RPortal"
VERSION=0.7
AUTHOR="Idan Sofer"
LICENCE=Licence::GPL
depends_on("Ruby","1.6.7",ATLEAST)
depends_on("radical-db","0.7",ATLEAST)
depends_on("rportal-core","0.2",ATLEAST)
depends_on("radical-handler-webruby","0.7",ATLEAST)
depends_on("radical-auth-rportal","0.2",ATLEAST)
define('radical_handler_class','RPortal::RPortalHandler')
