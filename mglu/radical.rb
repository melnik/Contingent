#!/usr/bin/ruby
# :include:docsrc/intro.rdoc

Dir.chdir(File.dirname($0))

args=ARGV.clone
require 'lib/help'
require 'getoptlong'
HelpInfo.addOption("Radical",['-d','--daemon'],"Run as daemon")
HelpInfo.addOption("Radical",['-c','--config'],"Specify a configuration file")
HelpInfo.addOption("Radical",['-F','--log-file'],"Specify a logfile")
HelpInfo.addOption("Radical",['-P','--pid-file'],"Specify a pidfile")
HelpInfo.addOption("Radical",['-p','--profile'],"Enable profiler")
HelpInfo.addOption("Radical",['-l','--load-plugin'],"Explictly load the specified plugins(comma seperated)")
HelpInfo.addOption("Radical",['-L','--load-plugin-path'],"Add the following directories to the plugin path(comma seperated)")
opts=GetoptLong.new(["--daemon","-d",GetoptLong::NO_ARGUMENT],
		    ["--config","-c",GetoptLong::REQUIRED_ARGUMENT],
		    ["--profile","-p",GetoptLong::NO_ARGUMENT],
		    ["--help","-h",GetoptLong::NO_ARGUMENT],
		    ["--load-plugin","-l",GetoptLong::REQUIRED_ARGUMENT],
		    ["--load-plugin-path","-L",GetoptLong::REQUIRED_ARGUMENT],
		    ["--log-file","-F",GetoptLong::REQUIRED_ARGUMENT],
			["--pid-file","-P",GetoptLong::REQUIRED_ARGUMENT]
		    )
load_plugins=[]
logfile=nil
pidfile='/var/run/radical/radical.pid'
opts.each do |o,arg|
   case o
   when "--daemon" 
      $daemon=true
   when "--profile" 
      $profile=true
   when "--config"
      puts "Using configuration file #{arg}"
      $conf_file=arg
   when "--help"
      print HelpInfo
      exit
   when "--load-plugin"
      load_plugins+=arg.split(",")
   when "--load-plugin-path"
      $PLUGIN_LOADPATH = arg.split(",")
   when "--log-file"
      logfile=arg
   when "--pid-file"
      pidfile=arg
   end
   
end

if $daemon
   if not pid=fork
      Process.setsid
      [$stdin,$stdout,$stderr].each { |stream| stream.reopen "/dev/null","w"}
   else
      File.open(pidfile, 'w').puts(pid)
      exit
   end
end

# av: save global binding for future use
$global_context = binding
alias :original_require :require
module Kernel
	alias :original_require :require
end

require 'lib/plugin_engine'

if $profile
   require 'profile'
end


if (logfile)
   PluginManager.load_plugin('radical-logger',{ 'output_file' => logfile } )
end

PluginManager.load_plugin('radical-core')
(load_plugins||=[]).each do |plugin|
   PluginManager.load_plugin plugin
end

# -- avfix: windows has no SIGHUP --
#
# trap "SIGHUP" do 
#   Radical::Log.info("Recieved a SIGHUP signal")
#   $restart=true
#   Radical.shutdown
#end

trap "SIGTERM" do
   Radical::Log.info("Recieved a SIGTERM signal")
   Radical.shutdown
end
trap "SIGINT" do 
   Radical.shutdown
end

begin
   Radical.wait
   main=Thread.main
   Thread.list.each do |t|
      Thread.kill t if t!=main
   end
   GC.start
   if $restart
      exec $0,*args
   end
rescue Interrupt
end
