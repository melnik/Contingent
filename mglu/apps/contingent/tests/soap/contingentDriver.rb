require 'default.rb'

require 'soap/rpc/driver'

class StudentsSrvPort < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://www.example.org/"
  MappingRegistry = ::SOAP::Mapping::Registry.new

  Methods = [
    [ "http://contingent.bmstu.ru/get",
      "get",
      [ ["in", "getRequest", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "getRequest"], false],
        ["out", "getResponse", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "getResponse"], false] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "http://contingent.bmstu.ru/listStudents",
      "listStudents",
      [ ["in", "listStudentsRequest", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "listStudentsRequest"], false],
        ["out", "listStudentsResponse", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "listStudentsResponse"], false] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "http://contingent.bmstu.ru/listOrders",
      "listOrders",
      [ ["in", "listOrdersRequest", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "listOrdersRequest"], false],
        ["out", "listOrdersResponse", ["::SOAP::SOAPElement", "http://contingent.bmstu.ru/", "listOrdersResponse"], false] ],
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

