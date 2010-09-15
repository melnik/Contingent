require 'base'
RPortal.register_module('base') do 
   sql_require 'users'
   sql_require 'groups'
   add_link('home','index.rb')
end

class String
   def enable_urls()
      gsub(Regexp.new('([^\'"])(http://|https://|ftp://|mailto:|news:)([^"\'\s<>()\]\[]+)(?![\'"])'),"\\1<a href=\"\\2\\3\"><u>\\2\\3</u></a>")
   end
end
