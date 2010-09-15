require 'interface/tabs'
require 'extensions'

tabs = case get_values['target']
when 'student' then
	[
		{ 'name' => 'nav',    'title' => 'Навигация' },
		{ 'name' => 'search', 'title' => 'Поиск'     },
	]
when 'applicant', 'order', 'user' then
	[
		{ 'name' => 'search', 'title' => 'Поиск'     },
	]
end

params = {
	'target'     => get_values['target'],
	'faculty_id' => get_values['faculty_id'],
	'return_url' => get_values['return_url'],
}.compact.url_encode

print make_tabs( tabs.collect do |tab|
	{
		'title' => tab['title'],
		# Black_TODO: think about this dirty hack
		'url'   => "/tools/#{tab['name']}.rb?#{if tab['name'] == 'nav' and get_values['return_url'] =~ /^\/student\/list\.rb/ then
			params.gsub(/(return_url=(.+?)\.rb)/, "\\1#{'?student_state=studying'.url_encode}").gsub(/(%3F)(.+?)(%3F)/, '\1\2%26')
		else
			params
		end}",
		'name'  => "#{tab['name']}_tab"
	}
end )
