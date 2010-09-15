referer = (get_values['referer'] || request.header['Referer'])

raise "Unable to get referer either from URL or HTTP header" if referer.nil?

referer.gsub!(/^http:\/\/(.*?)\//, '/')

raise "Unable to parse referer: \"#{referer}\"" unless referer =~ /^\/(.*?)\..*?(\?(.*))?$/

page, params = $1, $3

response.redirect case page
when 'tools/search' then
	params =~ /target=(\w+?)$/; "/help/#{page}_#{$1}.html" # TODO: fix RE
when /_toolbar$/ then
	"/help/#{page.gsub(/_toolbar$/, '')}.html"
else
	"/help/#{page}.html"
end
