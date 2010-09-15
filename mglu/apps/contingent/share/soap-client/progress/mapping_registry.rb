require 'soap/mapping'

module Progress

module ProgressMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new

  EncodedRegistry.register(
    :class => Progress::BaseObject,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "BaseObject",
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::Exam,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Exam",
    :schema_element => [
      ["subjectName", "SOAP::SOAPString"],
      ["mark", "Progress::Classifier"],
      ["amountOfHours", "SOAP::SOAPInteger"],
      ["term", "SOAP::SOAPInteger"],
      ["testType", "SOAP::SOAPString"],
      ["sessionDelay", "SOAP::SOAPDate"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::Mark,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Mark",
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"],
      ["exams", "Progress::Exam[]"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::Classifier,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Classifier",
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"],
      ["code", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::GetRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "getRequest",
    :schema_element => [
      ["id", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::GetResponse,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "getResponse",
    :schema_element => [
      ["marks", "Progress::Mark"]
    ]
  )

  EncodedRegistry.register(
    :class => Progress::ListMarksRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listMarksRequest",
    :schema_element => [
      ["group", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.set(
    Progress::ListMarksResponse,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://progress.bmstu.ru/", "Mark") }
  )

  EncodedRegistry.register(
    :class => Progress::ListClassifierRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listClassifierRequest",
    :schema_element => [
      ["name", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.set(
    Progress::ListClassifierResponse,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new("http://progress.bmstu.ru/", "Classifier") }
  )

  LiteralRegistry.register(
    :class => Progress::BaseObject,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "BaseObject",
    :schema_qualified => false,
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::Exam,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Exam",
    :schema_qualified => false,
    :schema_element => [
      ["subjectName", "SOAP::SOAPString"],
      ["mark", "Progress::Classifier"],
      ["amountOfHours", "SOAP::SOAPInteger"],
      ["term", "SOAP::SOAPInteger"],
      ["testType", "SOAP::SOAPString"],
      ["sessionDelay", "SOAP::SOAPDate"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::Mark,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Mark",
    :schema_qualified => false,
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"],
      ["exams", "Progress::Exam[]"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::Classifier,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "Classifier",
    :schema_qualified => false,
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["name", "SOAP::SOAPString"],
      ["code", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::GetRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "getRequest",
    :schema_qualified => false,
    :schema_element => [
      ["id", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::GetResponse,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "getResponse",
    :schema_qualified => false,
    :schema_element => [
      ["marks", "Progress::Mark"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::ListMarksRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listMarksRequest",
    :schema_qualified => false,
    :schema_element => [
      ["group", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::ListMarksResponse,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listMarksResponse",
    :schema_element => [
      ["marks", ["Progress::Mark[]", XSD::QName.new("http://progress.bmstu.ru/", "marks")]]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::ListClassifierRequest,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listClassifierRequest",
    :schema_qualified => false,
    :schema_element => [
      ["name", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => Progress::ListClassifierResponse,
    :schema_ns => "http://progress.bmstu.ru/",
    :schema_type => "listClassifierResponse",
    :schema_element => [
      ["classifier", ["Progress::Classifier[]", XSD::QName.new("http://progress.bmstu.ru/", "classifier")]]
    ]
  )
end

end
