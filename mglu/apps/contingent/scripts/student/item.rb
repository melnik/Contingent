require 'auth'

( u = auth_user_current ).require_permissions 'student_view'

require 'data/student'
require 'interface/tabs'

tmpl = template 'student/item'

tmpl.student_id = ( s = Student.load get_values['student_id'].to_i ).oid

tmpl.full_name   = s.name
tmpl.status      = s.status
tmpl.card_number = s.card_number
tmpl.group_name  = s.group.name
tmpl.editable    = u.has_permissions('student_edit')

tmpl.tabs = make_tabs( tabs = [
	{ 'title' => 'Общие сведения',    'url' => 'common.rb' },
	{ 'title' => 'Образование',       'url' => 'education_basic.rb' },
	{ 'title' => 'Условия обучения',  'url' => 'education_current.rb' },
	if s.studying? then
		nil
	else
		{ 'title' => 'Итоговый документ', 'url' => 'education_result.rb' }
	end,
	{ 'title' => 'Воинский учет',     'url' => 'military.rb' },
	{ 'title' => 'История обучения',  'url' => 'history.rb' },
# 	{ 'title' => 'Выплаты',           'url' => 'grants.rb' },
].compact.collect do |tab|
	{ 'title' => tab['title'], 'url' => "item/#{tab['url']}#{ unless tab['url'].include? '?' then '?' else '&' end }student_id=#{s.oid}" }
end )

tmpl.tabs_count = tabs.length

print tmpl.render
