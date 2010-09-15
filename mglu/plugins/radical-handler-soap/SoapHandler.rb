$KCODE = 'UTF8'

module Radical
	module Handlers
		class SoapHandler < BaseHandler
			include PersistentHandler

			attr_reader :servant

			def initialize(params)
				@default_namespace = params['namespace']

				# HACK: This might be reimplemented some day...
				for path in params['load_path'].split(':') do
					$LOAD_PATH << File.expand_path(path)
				end

				if params['class'] then
					require File.expand_path(params['load_path'] + '/stub.rb')
					portclass = Kernel::const_get(params['class'])
					@servant = portclass.new
				else
					Log.warn 'No init script specified', 'SoapHandler'
				end
			end

			def execute(req, res)
				begin
					$KCODE = 'UTF8'
					res.body = @servant.execute(req.data.read(req.header['Content-Length'].to_i))
					res.status = 200
					res.header['Content-Type'] = 'text/xml; charset=utf-8';
				rescue Exception => e
					res.status = 500
					res.body = <<EOF
<env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<env:Body>
<env:Fault env:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:n1="http://schemas.xmlsoap.org/soap/encoding/">
<faultcode xsi:type="xsd:string">Server</faultcode>
<faultstring xsi:type="xsd:string"><![CDATA[#{e.to_s}]]></faultstring>
<faultactor xsi:type="xsd:string">Radical::Handlers::SoapHandler</faultactor>
<detail xsi:type="n2:SOAPException" xmlns:n2="http://www.ruby-lang.org/xmlns/radical/type/custom"><![CDATA[
#{e.backtrace.join("\n")}
]]></detail>
</env:Fault>
</env:Body>
</env:Envelope>
EOF
#					e.to_s + "\n" + e.backtrace.join("\n")
					res.header['Content-Type'] = 'text/xml; charset=utf-8'
				end
				res.header['Content-Length'] = res.body.length
				$KCODE = 'NONE'
			end
		end
	end
end

$KCODE = 'NONE'
