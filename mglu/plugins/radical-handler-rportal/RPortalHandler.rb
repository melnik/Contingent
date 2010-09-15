

module RPortal
   class RPortalHandler < Radical::Handlers::WebRubyScriptHandler



      class ModuleContext

	 attr_reader :tables,:links
	 def initialize()
	    @tables=[]
	    @links=[]
	 end

	 def sql_require(table)
	    @tables << table
	 end

	 def add_link(id,url)
	    @links << [id,url]
	 end

      end

      def self.params=(params)
	 super
	 if cfgfile=params['cfgfile']
	    xml=REXML::Document.new(File.new(cfgfile).read)
	    self.configure(xml)
	 else
	    raise "Configuration file not specified"
	 end
      end

      def self.configure(xml)
	 @xmlconf=xml
	 conf=xml.elements['/rportalConf/Database']
	 @workdir=xml.elements['/rportalConf/Workdir']||'rportal/'
	 @workdir=File.expand_path @workdir
	 @scriptdir=File.expand_path 'scripts',@workdir
	 @staticdir=File.expand_path 'static',@workdir
	 self.directory=@scriptdir
	 if not conf.nil?
	    conf=conf.attributes
	    db=Radical::DB::Database.new(conf['uri'],conf['user'],conf['pass'],conf['params'])
	    @sql=RPortal::SQL.new(db)
	    @auth=RPortal::Auth.new(@sql)
	 else
	    Radical::Log.warn("Database not defined","RPortalHandler")
	 end
	 @xmlconf.elements.each('/rportalConf/Modules/Module') do |mod|
	    mod=mod.text
	    modules=RPortal.modules
	    PluginManager.load_plugin("rportal-module-#{mod}")
	    m=ModuleContext.new
	    m.instance_eval &modules[mod]
	    m.tables.each do |tbl|
	       begin
		  @sql.execute("SELECT 1 from rportal_#{tbl} LIMIT 1")
	       rescue DBI::DatabaseError
		  Radical::Log.warn("Table rportal_#{tbl} was not found in")
	       end
	    end
	    main_links.concat m.links
	 end
      end

      def self.workdir()
	 @workdir
      end

      def self.scriptdir()
	 @scriptdir
      end

      def self.staticdir()
	 @staticdir
      end

      def self.sql()
	 @sql
      end

      def self.auth()
	 @auth
      end

      def rportal_auth(user,password)
	 self.class.auth.auth("RPortal",user,password)
      end

      def self.main_links()
	 @main_links||=[]
      end

      def sql()
	 @sql||=self.class.sql()
      end

      def workdir()
	 self.class.workdir
      end

      def scriptdir()
	 self.class.scriptdir
      end

      def staticdir()
	 self.class.staticdir
      end

      def main_links()
	 self.class.main_links
      end

      def render(name=nil,title=nil,*args)
	 if not @index
	    index(title)
	    if not name.nil?
	       @index.main=template(name,*args)
	    end
	 end
	 print @index.render
	 @index
      end

      def index(title="")
	 if @index.nil?
	    uid=session['uid']
	    @index=i=template('index',uid,title)
	    if not uid.nil?
	       user=sql.getUserInfo(uid)
	       i['status']=template 'userLoggedStatus',user['name']
	       i.addSidebarLink('logout','login')
	    else
	       i['status']=template 'userNotLoggedStatus'
	       i.addSidebarLink('login','login')
	       i.addSidebarLink('Register new user','register')
	    end
	    main_links().each do |item|
	       descr,link=item
	       i.addSidebarLink(descr,link)
	    end
	 end
	 @index
      end

      def error_not_found(e)
	 a=template 'index'
	 a['Main']=template 'errors/scriptNotFound'
	 @outbuf=""
	 print a.render
      end

      def template(name,*args)
	 super("RPortal/#{name}",*args)
      end

      def error_script(e)
	 index.main=template 'errors/general', e
	 @outbuf=""
	 render
      end
   end
end

