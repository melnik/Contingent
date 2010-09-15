DESCRIPTION="Authentication module for RPortal"
VERSION=0.2
AUTHOR="Idan Sofer"
LICENCE=Licence::GPL
depends_on("Ruby","1.6.7",ATLEAST)
depends_on("radical-auth","0.7",ATLEAST)
define('radical_auth_class','RPortal::Auth')
