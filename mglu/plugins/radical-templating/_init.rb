require 'templates'
if (cfg=$plugin_settings['default_templates_dir'])
   Radical::Templating.directory=cfg
else
   puts "/radicalConf/Directories/Templates is undefined. using 'tmpl' subdir"
   Radical::Templating.directory='tmpl'
end
