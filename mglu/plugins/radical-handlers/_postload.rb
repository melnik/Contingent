def parse_handlers conf, uri_prefix
	result = []

	conf.elements.each 'File' do |file|
		if handler = Radical::HandlersList[file.attributes['handler']] then
			result << [ Radical::HandlerManager::Selectors::FileExt.new(file.attributes['ext']), handler ]
		else
			Radical::Log.warn "Handler '#{file.attributes['handler']}' undefined"
		end
	end

	conf.elements.each 'Uri' do |uri|
		prefix = uri_prefix + uri.attributes['target']
		remap  = (uri.attributes['remap'] == 'true')

		result << [ Radical::HandlerManager::Selectors::Uri.new(prefix, remap), parse_handlers(uri, prefix) ]

		if handler = Radical::HandlersList[uri.attributes['handler']] then
			result.last[1] << [ Radical::HandlerManager::Selectors::Default.new, handler ]
		end
	end

	return result
end

Radical::Conf.elements.each 'radicalConf/Handlers/Handler' do |handler|
	if type = handler.attributes['type'] then
		PluginManager.load_plugin "radical-handler-#{type}"

		params = {}; handler.elements.each 'Param' do |param|
			params[param.attributes['name']] = param.attributes['value']
		end

		begin
# 			Radical::HandlersList[handler.attributes['id']] = Kernel.const_get(PluginManager.metainfo("radical-handler-#{type}")['radical_handler_class']).new_handler(params)
			Radical::HandlersList[handler.attributes['id']] = eval(PluginManager.metainfo("radical-handler-#{type}")['radical_handler_class'] || '').new_handler(params)
		rescue NameError
			Radical::Log.warn "radical-handler-#{type} does not state which class it defines, ignoring '#{handler.attributes['id']}'"
		end
	else
		Radical::Log.warn "Handler type not given, ignoring '#{handler.attributes['id']}'"
	end
end

handlers = []; Radical::Conf.elements.each 'radicalConf/Mapping/Host' do |host|
	name = host.attributes['name'] || ''
	name = '' if name == '*' # Default host

	handlers << [ Radical::HandlerManager::Selectors::VirtualHost.new(name), parse_handlers(host, '') ]
end; Radical::HandlerManager.handlers = handlers
