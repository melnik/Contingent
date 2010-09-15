require 'config'
require 'auth'

u = auth_user_current

mode = get_values['mode']
if $MAIN_MODES.keys.grep(mode).empty?
	if u.nil?
		mode = 'student'
	elsif not u.perms.grep('news_view').empty?
		mode = 'news'
	else
		mode = nil
		$MAIN_MODES.keys.each { |m|
			mode = m if mode.nil? and not u.perms.grep(/^#{m}_/).empty?
		}
		raise "Current user has no allowed modes" if mode.nil?
	end
end

args = get_values['args']
args = '?' + args.gsub(/@/, '&').gsub(/:/, '=') if args

tmpl = template 'index'
tmpl.mode = mode
tmpl.main_src = (case mode
		 when 'login' then "login.rb#{args}"
		 when 'help' then 'help/index.html'
		 else "#{mode}/index.rb#{args}"
		 end)
print tmpl.render
