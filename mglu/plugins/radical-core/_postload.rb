Radical::Conf.elements.each 'radicalConf/Plugins/Load' do |plugin|
	if name = plugin.attributes['name'] then
		params = {}; plugin.elements.each 'Param' do |param|
			params[param.attributes['name']] = param.attributes['value']
		end

		PluginManager.load_plugin name, params
	else
		raise "Plugin name not given!"
	end
end
