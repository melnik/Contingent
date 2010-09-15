require 'soap/rpc/driver'

class SessionPortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://e-u.bmstu.ru/sss/Session.php"
  MappingRegistry = ::SOAP::Mapping::Registry.new

  Methods = [
    [ "http://bmstu.ru/listMarks",
      "listMarks",
      [ ["in", "listMarksRequest", ["::SOAP::SOAPElement", "http://service.bmstu.ru/session", "listMarksRequest"], true],
        ["out", "listMarksResponse", ["::SOAP::SOAPElement", "http://service.bmstu.ru/session", "listMarksResponse"], true] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = MappingRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end
