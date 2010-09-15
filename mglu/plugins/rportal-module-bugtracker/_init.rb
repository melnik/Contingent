require 'bugs'
RPortal.register_module('bugtracker') do
   sql_require 'bugs'
   sql_require 'bugs_status'
   sql_require 'bug_log'
   sql_require 'bug_comments'
   add_link('bugs','bugs')
end
   
