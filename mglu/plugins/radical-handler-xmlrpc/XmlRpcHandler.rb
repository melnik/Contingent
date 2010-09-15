require 'singleton'
require 'iconv'

module Radical
	module Handlers

		# An XmlRpc Handler - uses xmlrpc4r, manipulate Radical::XMLRPC::Server
		# to add methods and the such
		class XmlRpcHandler < BaseHandler
			include PersistentHandler

			attr_reader :server

			def initialize params
				@server=::XMLRPC::BasicServer.new
				@server.add_introspection

				# HACK: This might be reimplemented some day...
				for path in params['load_path'].split(':') do
					$LOAD_PATH << File.expand_path(path)
				end

				if params['init'] then
					require File.expand_path(params['init'])

					_init @server
				else
					Log.warn 'No init script specified', 'XmlRpcHandler'
				end
			end

			def execute request, response
				if request.header['Content-Type'] =~ /^text\/xml(; charset=(.+))?$/ then
					request_charset, response_charset = $2 || 'latin1', $db_encoding

					response.status = 200
					response.body   = Iconv.conv(request_charset, response_charset,
						@server.process(
# 							Iconv.conv(response_charset, request_charset,
								request.data.read(request.header['Content-Length'].to_i)
# 							)
						)
					)

					response.header['Content-Type']   = "text/xml; charset=(#{response_charset})"
					response.header['Content-Length'] = response.body.length
				else
					response.status = 400
				end
			end
		end
	end
end
