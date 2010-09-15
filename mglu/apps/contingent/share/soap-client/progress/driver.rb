module Progress
require 'soap/rpc/driver'

class ProgressSrvPort < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://e-u.bmstu.ru/marks/server.php"

  Methods = [
    [ "http://progress.bmstu.ru/listMarks",
      "listMarks",
      [ ["in", "listMarksRequest", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "listMarksRequest"]],
        ["out", "listMarksResponse", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "listMarksResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "http://progress.bmstu.ru/listClassifier",
      "listClassifier",
      [ ["in", "listClassifierRequest", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "listClassifierRequest"]],
        ["out", "listClassifierResponse", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "listClassifierResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "http://progress.bmstu.ru/get",
      "get",
      [ ["in", "getRequest", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "getRequest"]],
        ["out", "getResponse", ["::SOAP::SOAPElement", "http://progress.bmstu.ru/", "getResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = ProgressMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = ProgressMappingRegistry::LiteralRegistry
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


end
