Radical::HandlerManager.handlers_list.each do |handler|
   if type=handler.params['cache_manager']
      if type!="none" then
	 PluginManager.load_plugin("radical-cache-#{type}")
	 if handler.kind_of? Class
	    handler.class_eval "
	    def _cache()
	       @_cache||=Radical::CacheManagers['#{type}']
	    end
	    "
	 else
	    handler.instance_eval "
	    def _cache()
	       @_cache||=Radical::CacheManagers['#{type}']
	    end
	    "
	 end
      end
   end
end
