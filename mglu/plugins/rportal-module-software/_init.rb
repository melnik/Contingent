require 'software'
RPortal.register_module('software') do
   sql_require 'software'
   sql_require 'software_versions'
   sql_require 'platforms'
   add_link 'Software','software.rb'
end
   
