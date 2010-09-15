require 'xsd/qname'

# {http://service.bmstu.ru/session}Subject
class Subject
  @@schema_type = "Subject"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["guid", "SOAP::SOAPString"], ["name", "SOAP::SOAPString"], ["readingKaf", "SOAP::SOAPString"]]

  attr_accessor :guid
  attr_accessor :name
  attr_accessor :readingKaf

  def initialize(guid = nil, name = nil, readingKaf = nil)
    @guid = guid
    @name = name
    @readingKaf = readingKaf
  end
end

# {http://service.bmstu.ru/session}TestType
class TestType
  @@schema_type = "TestType"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["guid", "SOAP::SOAPString"], ["name", "SOAP::SOAPString"], ["differential", "SOAP::SOAPBoolean"]]

  attr_accessor :guid
  attr_accessor :name
  attr_accessor :differential

  def initialize(guid = nil, name = nil, differential = nil)
    @guid = guid
    @name = name
    @differential = differential
  end
end

# {http://service.bmstu.ru/session}Mark
class Mark
  @@schema_type = "Mark"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["mark", "SOAP::SOAPInteger"], ["name", "SOAP::SOAPString"], ["guid", "SOAP::SOAPString"]]

  attr_accessor :mark
  attr_accessor :name
  attr_accessor :guid

  def initialize(mark = nil, name = nil, guid = nil)
    @mark = mark
    @name = name
    @guid = guid
  end
end

# {http://service.bmstu.ru/session}Marks
class Marks
  @@schema_type = "Marks"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["mark", "Mark"], ["testType", "TestType"], ["term", "SOAP::SOAPInteger"], ["subject", "Subject"]]

  attr_accessor :mark
  attr_accessor :testType
  attr_accessor :term
  attr_accessor :subject

  def initialize(mark = nil, testType = nil, term = nil, subject = nil)
    @mark = mark
    @testType = testType
    @term = term
    @subject = subject
  end
end

# {http://service.bmstu.ru/session}MarksResponse
class MarksResponse
  @@schema_type = "MarksResponse"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["guid", "SOAP::SOAPString"]]

  attr_accessor :guid

  def initialize(guid = nil)
    @guid = guid
  end
end

# {http://service.bmstu.ru/session}listMarksResponse
class ListMarksResponse < ::Array
  @@schema_type = "MarksResponse"
  @@schema_ns = "http://service.bmstu.ru/session"
  @@schema_element = [["response", ["MarksResponse[]", XSD::QName.new("http://service.bmstu.ru/session", "response")]]]
end

# {http://service.bmstu.ru/session}listMarksRequest
class ListMarksRequest < ::Array
  @@schema_type = "string"
  @@schema_ns = "http://www.w3.org/2001/XMLSchema"
  @@schema_element = [["Students", ["SOAP::SOAPString[]", XSD::QName.new("http://service.bmstu.ru/session", "Students")]]]
end

require 'soap-client/session/driver'
