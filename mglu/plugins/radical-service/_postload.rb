Radical::Conf.elements.each '/radicalConf/Services/Service' do |service|
	if type = service.attributes['type'] then
		PluginManager.load_plugin "radical-service-#{type}"

		params = {}; service.elements.each 'Param' do |param|
			params[param.attributes['name']] = param.attributes['value']
		end

		Radical::Services[service.attributes['id'] || (cnt ||= 0).next!] = Radical::ServiceRegistry[type].call(Radical::MasterHandler.new, params)
	else
		Radical::Log.warn "Service type not given, ignoring '#{service.attributes['id'] || (cnt ||= 0).next!}'"
	end
end

Radical::Services.start

Radical::registerShutdown do
	Radical::Services.stop
end
