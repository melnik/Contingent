module Radical

	Mimetypes=Object.new

	def Mimetypes.[](x)
		m=MIME::Types.type_for x
		return 'text/html; charset=utf-8' if m == 'text/html' # GREYFIX
		return 'text/plain; charset=utf-8' if m == 'application/x-javascript' # GREYFIX
		return 'text/plain; charset=utf-8' if m.nil? # GREYFIX
		m.content_type
	end
end
