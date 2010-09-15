require 'auth'

( cu = auth_user_current ).require_permissions 'news_edit'

require 'data/news'

tmpl = template 'news/item'

unless get_values['news_id'].empty? then
	n = News.load(get_values['news_id'].to_i)
end

if post_values['save'] then
	# TODO: this must look more accurate in future
	attributes = {}; for key, value in post_values do
		value.gsub! /:.*$/, '' if key =~ /_id$/
		attributes[key.to_s] = value
	end

	if get_values['news_id'].empty? then
		n = News.create
	end

	if n then
		n.subject = attributes['subject']
		n.body    = attributes['body']
		n.save
		response.redirect 'index.rb'
	end
end

if n then
	tmpl.news_id = n.oid
	tmpl.body = n.body
	tmpl.subject = n.subject
end

print tmpl.render
