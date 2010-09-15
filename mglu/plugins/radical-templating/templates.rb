
module Radical
   
   # = Radical's Templating system
   #
   # Radical has pretty much powerful templating system, they are stored
   # Under the template directory and are named by their relative location
   # (Such as 'radical/intro')
   #
   # Templates are compiled directly to ruby scripts and are cached
   # for speed gain.
   #
   # Each template object has it's own internal Hash where variables are extracted
   # from(see later), set with [] and []=
   #
   # == Syntax
   #
   # In principle the template compiler is based on ERuby(in fact most of it's
   # syntax is converted to ERuby), so it accepts ERuby syntax
   #
   # * <% %> Executes code
   # * <%= %> Executes code and returns the result
   # * <%# %> Are comments
   #
   # But in addition
   #
   # * Enclosed strings with <@ @> are internationalized, see _translate.rb
   # * Strings encolosed with <& &> are dumping variable from the hash
   # * <$ $> Is just like <& &> but passes the result into the I8N engine
   # * <* *> Is for importing another template
   # * <**templateName|MethodName**> defines the method MethodName that inserts in that location an instance of templateName
   #
   # Templates are imported by Radical::Templating::TemplateManager.[]
   # Which accepts the template name, language, and optional Hash to be 
   # implented.
   #
   # It returns a Radical::Templating::TemplateManager::Template object, 
   # Rendered using the _Radical::Templating::TemplateManager::Template#render
   # method.
   #
   # A template may also define it's own singleton methods(So template can have
   # well defined interface).
   # 
   # This is done based on the following syntax:
   #
   # <-- METHODS START -->
   #
   # [... methods ...]
   #
   # <--- METHODS END -->
   #
   # So your 'main' template might have set_title, set_content etc...
   #
   module Templating
      
      def self.directory=(path)
#	 @@directory=File.expand_path path
      end
      
      def self.directory()
	 # av: we don't need this at all
#	 @@directory||=(File.expand_path('tmpl'))
      end
      
      # Better to say pre-processor, it compiles our markup to ERuby code and
      # then passes it on to our superclass
      class TemplateCompiler_ < ERuby::Compiler
	 
	 CMDBLOCK=/(<-- ?([A-Za-z ]+) START ?-->([\w\W]+?)<-- ?\2 END ?-->)/
	 CMD=Regexp.new "(<! ?([A-Z]+) (.+?) ?!>)"
	 INTLSTR=/(<@([\w\W]+?)@>)/
	 INTLVAR=/(<\$([\w\W]+?)\$>)/
	 VAR=/(<&([\w\W]+?)&>)/
	 TMPL=/(<\*([\w\W]+?)\*>)/
	 MTMPL=/(<\*\*([\w\W]+?)\*\*>)/
	 # Overrides compile_string, has an optional use_ext parameter to set
	 # if an extended format should be returned(with singleton methods, initcode etc)
	 def compile_string(str,use_ext=false)
	    adata={}
	    methods=""
	    initcode=""
	    remove=[]
	    str.scan CMDBLOCK do |whole,cmd,part|
	       case cmd
	       when "METHODS"
		  methods=part
	       when "INITCODE"
		  initcode=part
	       end
	       remove<<whole
	    end
	    str.scan CMD do |whole,cmd,part|
	       case cmd
	       when "INIT"
		  adata['init']=part.split(" ")
	       when "ATTR"
		  adata['attr']=part.split(" ")
	       end
	       remove << whole
	    end
	    remove.each { |x| str[x]=""}
	    str.dup.scan(INTLSTR) { | whole,part |
	       part.gsub!('\'') { |x| "\\'" }
	       str[whole]="<%=intl '#{part}'%>"
	    }
	    
	    str.dup.scan(INTLVAR) { | whole,part |
	       if part=~/^\^(.*)/ then
		  str[whole]="<%=intl Thread.current[:session_vars]['#{$1}'].to_s%>"
	       else
		  str[whole]="<%=intl @#{part}.to_html%>"
	       end
	    }
	    str.dup.scan(VAR) { | whole,part |
		  str[whole]="<%= (#{part}).to_html %>"
	    }
	    str.dup.scan(MTMPL) { | whole,name|
	       name,iname=name.split '|'
	       initcode+="@_vars['#{iname}']=[]\n"
	       methods+="def #{iname}(*args)\n tpl=import('#{name}',*args)\n @_vars['#{iname}'] << tpl\n tpl\n end\n"
	       str[whole]="<%= @_vars['#{iname}'].to_html%>"
	    }
	    str.dup.scan(TMPL) { | whole,name| 
	       name,iname=name.split '|'
	       iname=iname||"tmpl_#{name}"
	       initcode+="@_vars['#{iname}']=import '#{name}'\n"
	       str[whole]="<%=@_vars['#{iname}'].to_html%>"
	    }
	    if use_ext
	       [super(str),methods,initcode,adata]
	    else
	       super(str)
	    end
	 end
	 
      end
       
      TemplateCompiler=TemplateCompiler_.new
	    
      # Singleton template manager, load, compiles and caches templates
      class TemplateManager
	 
	 
	 class Template
	    
	    attr_accessor :lang, :data, :vars, :initcode
	    
	    def initialize(lang="en",*args)
	       @_vars={}
	       @_outbuf=""
	       @_lang=lang
	       _name
	       _initcode
	       init(*args)
	    end
	    
	    def init(*args)
	    end
	    
	    # Make #[] and #[]= private methods
	    def self.make_private()
	       private :[],:[]=
	    end
	    
	    # Pass str to the I8N engine
	    def intl(str)
		  Radical::Intl[@_lang,_name][str]
	    end
	    
	    # Print to the output buffer
	    def print(str)
	       @_outbuf+=str.to_s
	    end
	    
	    # Import a template
	    def import(name,*args)
	       if not name=~/^\//
		  name=@_dir+name
	       end
	       @_vars[name]=TemplateManager[name,@_rootdir,@_lang,*args]
	    end
	    
	    def [](key)
	       eval "@#{key}"
	    end
	    
	    def []=(key,val)
	       eval "@#{key}=val"
	    end
	    
	    def render(mark=false)
	       if mark then
		  print "<!-- Start template #{@_name}  -->\n" ;
	       end
	       _template
	       if mark then
		  print "<!-- End template #{@_name}  -->\n" ;
	       end
	       @_outbuf
	    end
	    
            alias_method :to_s, :render
	 end
	 
	 def self.templateFactory(name,rootdir)
	    fn="#{rootdir}/#{name}.tmpl"
	    begin
	       file=File.new(fn,"r");
	    rescue Exception => x
	       raise "Unable to load template #{name}"
	    end
	    str=file.read
	    data,methods,initcode,adata=TemplateCompiler.compile_string(str,true);
	    t=Class.new Template
	    if attr=adata['attr']
	       t.class_eval "attr_accessor "+((attr.map { |a| ":#{a}" }).join ", ")
	    end
	    if i=adata['init']
	       str="def init("+i.join(", ")+")\n"
	       i.each do |x|
		  str << "  @#{x}=#{x};\n"
	       end
	       str << "end\n"
		   str << "attr_reader " + i.collect { |x| ":#{x}" }.join(', ') + "\n"
	       t.class_eval str
	    end
	    t.class_eval "def _template()
	    #{data}
	    end"
	    t.class_eval "def _initcode()
	    #{initcode}
	    end"
	    t.class_eval "def _name()
	                @_name='#{name}'
			@_rootdir='#{rootdir}'
			d=@_name.split '/'
			d.pop
			@_dir=d.join('/') + '/'
			def self._name()
			   @_name
			end
			end"
	    t.class_eval methods
	    return t
	 end
	    
	 
	 CACHE_SIZE=100
	 @@cache=Util::EntryCache.new(CACHE_SIZE)
	 
	 private
	 def self.load(name,rootdir,cached_name=nil)
	    cached_name||=name
	    t=templateFactory(name,rootdir)
	    mtime=File.mtime("#{rootdir}/#{name}.tmpl")
	    @@cache[cached_name]=[name,t,mtime,rootdir]
	    return t
	 end
	 
	 public
	 # Load the template _name_
	 def self.[](name,rootdir,lang="en",*args)
	    # p "Loading template '#{rootdir}/#{name}'"
	    cached=@@cache[name]
	    if cached.nil? then
	       cached_name=name
		   
		   # av: WTF? :(
		   
#	       begin
		  t=load(name,rootdir,cached_name)
#	       rescue Exception => e
#		  if name=~/\//
#		     slashed_name=name.split("/")
#		     name_suffix=slashed_name.pop
#		     slashed_name.pop
#		     slashed_name << name_suffix
#		     name=slashed_name.join("/")
#		     retry
#		  else
#		  	p e.backtrace
#		     raise e
#		  end
#	       end
	    else
	       cached_name=name
	       name=cached[0]
	       mtime=File.mtime("#{rootdir}/#{name}.tmpl")
	       cmtime=cached[2]
	       if mtime>cmtime then
		  t=load(name,rootdir,cached_name)
	       else
		  t=cached[1]
	       end
	    end
	    return t.new(lang,*args)
	 end
	 
      end
   end
end
	 
	 
	    
	    
	    
	    
	    
	    
