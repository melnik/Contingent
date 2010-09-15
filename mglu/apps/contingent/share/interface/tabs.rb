def make_tabs tabs
	tmpl = template 'widgets/tabs'
	tmpl.tabs = tabs
	tmpl.render
end
