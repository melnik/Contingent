Radical::Conf.elements.each '/radicalConf/Authenticators/Auth' do |auth|
	if type = auth.attributes['type'] then
		PluginManager.load_plugin "radical-auth-#{type}"

		params = {}; auth.elements.each 'Param' do |param|
			params[param.attributes['name']] = param.attributes['value']
		end

		begin
# 			Radical::Authenticators[auth.attributes['id']] = Kernel.const_get(PluginManager.metainfo("radical-auth-#{type}")['radical_auth_class']).new(params)
			Radical::Authenticators[auth.attributes['id']] = eval(PluginManager.metainfo("radical-auth-#{type}")['radical_auth_class']).new(params)
		rescue NameError
			Radical::Log.warn "radical-auth-#{type} does not state which class it defines, ignoring '#{auth.attributes['id']}'"
		end
	else
		Radical::Log.warn "Auth type not given, ignoring '#{auth.attributes['id']}'"
	end
end
