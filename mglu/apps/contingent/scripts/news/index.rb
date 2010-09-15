require 'auth'

( u = auth_user_current ).require_permissions 'news_view'

require 'data/news'

tmpl = template 'news/list'
tmpl.editable = !u.perms.grep('news_edit').empty?

News.list(nil, [ 'news_id', 'news_date', 'subject', 'body', 'full_name' ] ) { |n0, n1, n2, n3, n4|
	tmpl.add_row(n0, n1, n2, n3, n4, tmpl.editable)
}

print tmpl.render
