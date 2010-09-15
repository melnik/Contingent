require 'extensions'

tmpl = template 'wait'
tmpl.url = get_values['url'].gsub(/@/, '?').gsub(/,/, '&').gsub(/:/, '=')
print tmpl.render