require 'Logging'
def PluginManager.puts(str)
   Radical::Log.log("PluginManager",str)
end

if file=$plugin_settings['output_file']
   Radical::Log.info "Redirecting log to file"
   Radical::Log.io=File.new(file,"a+")
   Radical::Log.info "Opened logfile"
end
