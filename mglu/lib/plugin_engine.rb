# * Content of the file is copyrighted by Idan Sofer <idan@idanso.dyndns.org> 
# * and is licenced under the terms of the GPL Version 2
#
# This module provides a powerfull plug-in engine for use in modular ruby applications.
#
# It provides more then a simple mechanism for loading software components. each
# "plugin" has it's own meta-information(description,version etc), as well as a list of dependencies.
#
# So suppose plugin 'foo' is loaded, and 'foo' depends on 'bar', then 'bar' is
# implictly loaded as well(If 'bar' is not available, or is too old version, 
# dependency exception pop ups)
#
# = Writing a plug-in
#
# A plug-in is basicly a subdirectory named after the plugin, _info.rb file, which
# provides the meta information about the plugin, and _init.rb, which initializes
# the plugin, including relevant Kernel.require calls.
#
# == _info.rb
# 
# _info.rb is, and it's extension suggests, ruby script, however, it is executed
# in a special context making it look more like an ordinary configuration file.
#
# For example:
#
#DESCRIPTION="Radical base package - provides main handler loop"
#VERSION=0.7
#AUTHOR="Idan Sofer"
#LICENCE=Licence::GPL
#depends_on("Ruby","0.6.7",ATLEAST)
#depends_on("radical-conf","0.7",ATLEAST)
#depends_on("radical-rewrite","0.7",ATLEAST)
#depends_on("util-entryCache") 
#
# For more details take a look at Plugins::PluginInfoContainer
#
# == _init.rb
#
# This file should contain the actual plugin loading code. It may require
# other modules, either located at the directory of the plugin or at $LOAD_PATH
#
# For the duration of _init.rb(and modules required from it) execution, 
# Kernel.require is temporarly modified so modules will first be attempted to 
# load from the plugin directory using explict path, only if this fails 
# $LOAD_PATH is used.
#
# _init.rb must NOT call the plugin manager to load other plugins, any attempt 
# to do so shall result in an exception.
#
# == _postload.rb
#
# The file presence is _optional_, this script is executed after loading the plugin
# and all of it's dependencies is completed. Calling the plugin manager
# is allowed in this context and that it's main usage.

require 'singleton'
module Plugins
   
   # Create a struct to describe a plugin
   PluginInfo=Struct.new(:name,:basedir,:description,:version,:author,:licence,:depends,:metainfo);
   # Create a struct to describe a dependency
   Dependency=Struct.new(:plugin,:deptype,:deptarget,:depversion,:depversion_type)
   class Dependency
      # Dependency type
      DEPENDS=0
      CONFLICTS=1
      RECOMMENDS=2
      SUGGESTS=3
      
      module Version
	 EQUAL=0
	 ABOVE=1
	 BELOW=2
	 ATLEAST=3
	 ATMOST=4
      end
      
      def to_s
	 case depversion_type
	 when Version::EQUAL
	    sign="=="
	 when Version::ABOVE
	    sign=">"
	 when Version::BELOW
	    sign="<"
	 when Version::ATLEAST
	    sign=">="
	 when Version::ATMOST
	    sign="<="
	 end
	 case deptype
	 when DEPENDS
	    type="depends on"
	 when CONFLICTS
	    type="conflicts with"
	 when RECOMMENDS
	    type="recommends"
	 when SUGGESTS
	    type="suggests"
	 end
	 return "plugin #{plugin}  #{type} #{deptarget} #{sign} #{depversion}\n"
      end
   end
   
   # A class to describe a version of plugin. it is parsed either from Numeric
   # or String into x.x.x style numbering(major,minor,micro)
   class PluginVersion
      include Comparable
      attr_accessor :major,:minor,:micro,:nil
      
      def to_s()
	 "#{major}.#{minor}.#{micro}"
      end
      
      def initialize(ver)
	 if ver.nil?
	    @nil=true
	    return
	 else
	    @nil=false
	 end
	 if ver.kind_of? Numeric
	    ver=ver.to_f
	    @major=ver.ceil
	    @minor=(0-ver-ver.ceil).to_s.split('.').pop.to_i
	    @micro=0
	 elsif ver.kind_of? String
	    ver=ver.split "."
	    @major=ver[0].to_i
	    @minor=ver[1].to_i
	    @micro=ver[2].to_i
	 else raise TypeError.new
	 end
      end
      
      def <=>(other)
	 if not other.kind_of? self.class
	    other=self.class.new other
	 end
	 if major==other.major then
	    if minor==other.minor then
	       if micro==other.micro then
		  return 0;
	       else
		  return micro.<=>(other.micro)
	       end
	    else
	       return minor.<=>(other.minor)
	    end
	 else
	    return major.<=>(other.major)
	 end
      end
   end
   
   # This module will somehow include predefined licence declarations
   module Licence
      GPL=""
   end
   
   # This module is the context _info.rb runs in
   module PluginInfoContainer
      include Dependency::Version
      
      # Runs every time a new plugin is loaded, for internal use only
      def self.reset()
	 @@depends=[]
	 @@akas=[]
	 @@virtuals=[]
	 @@metainfo={}
      end
      
      # Dependency attribute reader, for internal use only.
      def self.depends()
	 @@depends
      end
      
      # AKA's attribute reader, internal use only.
      def self.akas()
	 @@akas
      end
      
      # virtuals attribute reader, for internal use only.
      def self.virtuals()
	 @@virtuals
      end
      
      def self.metainfo()
	 @@metainfo
      end
      
      def self.define(key,value)
	 @@metainfo[key]=value
      end
      
      # Describe a dependency
      def self.depends_on(target,version=nil,vertype=nil)
	 @@depends<< [Dependency::DEPENDS,target,version,vertype]
      end
      
      # Describe a conflicting dependency
      def self.conflicts(target,version=nil,vertype=nil)
	 @@depends<< [Dependency::CONFLICTS,target,version,vertype]
      end
      
      # Recommend a package
      def self.recommends(target,version=nil,vertype=nil)
	 @@depends<< [Dependency::RECOMMENDS,target,version,vertype]
      end
      
      # Suggest a package
      def self.suggests(target,version=nil,vertype=nil)
	 @@depends<< [Dependency::SUGGESTS,target,version,vertype]
      end
      
      # This package is Also Known As (target)
      def self.aka(target)
	 @@akas << target
      end
      
      # Provides a virtual package
      def self.provides(virtual)
	 @@virtuals << virtual
      end
      
   end
   
   # The plugin loader raises this exception when a dependency cannot be satisfied
   class DependencyError < Exception
      attr_reader :deps
      def initialize(deps)
	 @deps=deps
	 if not @deps.kind_of? Array
	    @deps=[@deps]
	 end
      end
      
      def to_s()
	 str="Unable to satisfy the following dependencies:\n"
	 @deps.each do |d|
	    str << d.to_s 
	 end
	 return str
      end
   end
   
   # A package depends upon a virtual package, the packages providing it are not loaded
   class VirtualDependencyError < Exception
      def initialize(target,virtuals)
	 @target,@virtuals=target,virtuals
      end
      
      def to_s()
	 str="Package depends upon a virtual package, however plugin providing it is loaded:\n"
	 @virtuals.each do |v|
	    str << "#{v}\n"
	 end
	 str
      end
   end
   
   # Plugin cannot be loaded for some reason.
   class LoadPluginError <  Exception
      def initialize(pname,reason)
	 @pname,@reason=pname,reason
      end
      
      def backtrace()
	 @reason.backtrace
      end
      
      def to_s()
	 "Error initializing '#{@pname}' : #{@reason}\n"
      end
   end
   
   # No such plugin
   class UnknownPlugin < Exception
      def initialize(pname)
	 @pname=pname
      end
      
      def to_s()
	 "Unknown plugin #{@pname}"
      end
   end
   
   # Provides the context(binding) plugin init script shall run in
   class PluginContext
      
      def initialize(basedir)
	 @basedir=basedir
      end
      
   end
   
   # Provides the actual plugin loader facilities
   class PluginManager_
      include Singleton
      
      attr_reader :plugins,:basedir
      
      def initialize()
	 @vpt={} #Virtual packages table
	 @loader_stack=[]
	 @plugins={}
	 @conflicts=[]
	 @loaded_plugins=[]
	 @postload=[]
	 @in_progress=false
	 puts "PluginManager initialized using basedir '#{$PLUGIN_LOADPATH.join(',')}'"
	 $PLUGIN_LOADPATH.each do |path|
	    begin
	       dir=Dir.new path
	    rescue Errno::ENOENT => x
	       puts "Directory '#{path}' doesn't exist"
	       next
	    end
	    dir.each do |pname|
	       name=path+"/"+pname
	       if (FileTest.directory? name) and pname!=".." and not pname=~/^\./ then
		  query_plugin(path,pname)
	       end
	    end
	 end
      end
      
      # Return meta information about the requested plugin, returns nil
      # if not loaded
      def metainfo(pname)
	 if (p=@plugins[pname])
	    p.metainfo
	 else
	    nil
	 end
      end
      
      # Attempt to load the plugin named 'pname'
      def load_plugin(pname,params={})
	 raise Exception.new if @in_progress # Disallow calls from _init.rb
	 if not pname.kind_of? PluginInfo # If pname is not PluginInfo then look in our plugin hash
	    plug=@plugins[pname]
	    pname=plug.name if not plug.nil? #Used for AKA's
	 else
	    plug=pname
	    pname=plug.name
	 end
	 if not plug then # Couldn't find this plugin
	    if virtuals=@vpt[pname] then # Maybe it's virtual?
	       # Attempt to seek out virtuals
	       virtuals.each do |v|
		  if @loaded_plugins.index(v)
		     return true # We've got it!
		  end
	       end
	       raise VirtualDependencyError.new(pname,virtuals) # It is but no provider is loader
	    else
	       # No virtuals found, fallback to Kernel.require
	       begin
		  require pname.gsub(/-/,"/")
		  @loaded_plugins << pname
		  return true
	       rescue LoadError => e
		  raise UnknownPlugin.new(pname) # No such thing in our store Mr.
	       end
	    end
	 end
	 if @loader_stack.index(pname) then # We check in the loader stack if our plugin is already at loading process
	    raise "Dependency loop!" # It is, let's break the damn recursive loop
	 end
	 if @loaded_plugins.index(pname) # Is our plugin already loaded?
	    return true # So let's just return true
	 end
	 @loader_stack.push pname # Push the plugin name into the loader stack.
	 failed_deps=[] # Initialize failed dependencies array
	 @conflicts.each do |dep| # First check if any package loaded before reported a conflict with this package
	    if dep.deptarget==pname and @loaded_plugins.index(dep.plugin)
	       failed_plugins << dep 
	    end
	 end
	 plug.depends.each do |dep| # Iterate package dependencies
	    if dep.deptype==Dependency::DEPENDS
	       begin
		  load_plugin(dep.deptarget) # Attempt to load deptarget
	       rescue DependencyError => e 
		  failed_deps+=e.deps # deptarget has dependency issues, add them to the list
	       rescue UnknownPlugin => e
		  failed_deps << dep # deptarget does not exist
		  next
	       end
	       depplug=@plugins[dep.deptarget] # Get deptarget info
	       next if depplug.nil? and @vpt[dep.deptarget] # Depends on virtual, so don't check versioning
	       next if dep.depversion.nil 
	       case dep.depversion_type
	       when Dependency::Version::EQUAL
		  failed_deps << dep if depplug.version!=dep.depversion
	       when Dependency::Version::ABOVE
		  failed_deps << dep if depplug.version<=dep.depversion
	       when Dependency::Version::BELOW
		  failed_deps << dep if depplug.version>=dep.depversion
	       when Dependency::Version::ATMOST
		  failed_deps << dep if depplug.version>dep.depversion
	       when Dependency::Version::ATLEAST
		  failed_deps << dep if depplug.version<dep.depversion
	       end
	    end
	    
	    if dep.deptype==Dependency::CONFLICTS # Is it a conflict dependency?
	       @conflicts << dep
	       if not @loaded_plugins.index(dep.deptarget) then
		  next
	       end
	       depplug=@plugins[dep.deptarget]
	       if dep.depversion.nil
		  failed_deps << dep
		  next
	       end
	       case dep.depversion_type
	       when Dependency::Version::EQUAL
		  failed_deps << dep if depplug.version==dep.depversion
	       when Dependency::Version::ABOVE
		  failed_deps << dep if depplug.version>dep.depversion
	       when Dependency::Version::BELOW
		  failed_deps << dep if depplug.version<dep.depversion
	       when Dependency::Version::ATMOST
		  failed_deps << dep if depplug.version<=dep.depversion
	       when Dependency::Version::ATLEAST
		  failed_deps << dep if depplug.version>=dep.depversion
	       end
	    end
	 end
	 @loader_stack.pop # Remove package name from loader stack
	 raise DependencyError.new(failed_deps) if failed_deps.length>0
	 # Temprarly modify the behaviour of Kernel.require
	 Object.class_eval "
	   alias :require_orig :require;
	   def require(mod)
	      begin
		 require_orig \"#{plug.basedir}/#{pname}/\#{mod}\";
	      rescue LoadError => x
		 require_orig(mod);
	      end
	   end"
	 begin
	    @in_progress=true # Forbid calling the loader
	    $plugin_settings=params
	    $_current_plugin_dir="#{plug.basedir}/#{pname}/"
	    $plugin_loader_active=true
	    load("#{plug.basedir}/#{pname}/_init.rb") # execute _init.rb
	    $plugin_loader_active=false
	    $plugin_settings=nil
	 rescue Exception => x
	    raise LoadPluginError.new(pname,x)
	 ensure
	    @in_progress=false # Allow calling the loader again
	    Object.class_eval "alias :require :require_orig" # Return 'require' to normal
	 end
	 @loaded_plugins << pname
	 postload="#{plug.basedir}/#{pname}/_postload.rb" 
	 if File.exists?(postload)
	    @postload << [pname,postload] # Add postload of this package to the list if present
	 end
	 puts "Loaded #{pname}" 
	 if @loader_stack.empty? # Loader stack is empty, let's finish with postloads
	    pl=@postload
	    @postload=[]
	    pl.each do |pn,pfile|
	       load(pfile)
	       puts "Postload script of #{pn} executed"
	    end
	 end
	 return true
	 
      end
      
      # Check if the package is loaded
      def is_loaded?(pname)
	 return true if @loaded_plugins.index(pname)
	 return false
      end
      
      private
      
      # This is called by the plugin manager internally to query about plugins
      def query_plugin(path,pname)
	 name=path+"/"+pname
	 begin
	    info=File.new("#{name}/_info.rb").read
	 rescue Exception => x
	    puts "Warning - cannot load info file: #{x}"
	    return
	 end
	 depends=[]
	 container=PluginInfoContainer.clone
	 container.reset
	 container.module_eval info
	 container.depends.each do |d|
	    depends << Dependency.new(pname,d[0],d[1],PluginVersion.new(d[2]),d[3])
	 end
	 container.virtuals.each do |pro|
	    (@vpt[pro]||=[]) << pname
	 end
	 p=PluginInfo.new(pname,path,container::DESCRIPTION,PluginVersion.new(container::VERSION),container::AUTHOR,container::LICENCE,depends,container.metainfo)
	 container.akas.each do |nick|
	    if not @plugins[nick]
	       @plugins[nick]=p
	    end
	 end
	 @plugins[pname]=p
      end
      
      
   end
end
$PLUGIN_LOADPATH||=[]
$PLUGIN_LOADPATH+=['plugins']
PluginManager=Plugins::PluginManager_.instance
