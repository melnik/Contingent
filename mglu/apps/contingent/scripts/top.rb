require 'config'
require 'auth'
u = auth_user_current

tmpl = template 'top'

links = []
mode = get_values['mode']

$MAIN_MODES.each { |m, name|
	links << { 'name' => m, 'title' => name, 'href' => "#{m}/index.rb", 'target' => 'main' } unless u.perms.grep(/^#{m}_/).empty?
}

links << { 'name' => 'help', 'title' => 'Справка', 'href' => 'help/index.html', 'target' => 'main' }

if u.user_id
	links << { 'name' => 'settings', 'title' => 'Настройки', 'href' => '/user/password.rb', 'onClick' => 'javascript: window.open(this.href, \'new\', \'toolbar=0,menubar=0,top=240,left=272,width=480,height=130,scrollbars=1\'); return false;', 'target' => '_blank' }
	links << { 'name' => 'logout', 'title' => 'Выход', 'href' => 'logout.rb', 'target' => '_top' }
else
	links << { 'name' => 'login', 'title' => 'Вход', 'href' => 'login.rb?redirect=/index.rb', 'target' => 'main' }
end

tmpl.links = links
tmpl.mode = mode
print tmpl.render
