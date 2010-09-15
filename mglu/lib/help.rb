require 'singleton'
class HelpInfo_
   include Singleton
   
   def initialize()
      @sections={}
   end
   
   def addOption(section,option,text)
      s=@sections[section]||=[]
      s << [option,text]
   end
   
   def to_s()
      x="Usage:\n"
      x<< "\n"
      @sections.each do |k,v|
	 x<< " "*4+k+" options\n"
	 v.each do |option,text|
	    x<< (option.to_a.join(', ').ljust(30)+text)+"\n"
	 end
	 x << "\n\n"
      end
      x
   end
end
HelpInfo=HelpInfo_.instance
