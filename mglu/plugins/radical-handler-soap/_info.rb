DESCRIPTION="Radical SOAP handler"
VERSION=1.0
AUTHOR="Mikhail Yakshin"
LICENCE=Licence::GPL
depends_on("Ruby","0.6.7",ATLEAST)
depends_on("radical-core","0.7",ATLEAST)
define 'radical_handler_class','Radical::Handlers::SoapHandler'
