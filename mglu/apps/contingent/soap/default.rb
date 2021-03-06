# Generated by generate-wsdl. Do not edit!

module ContingentSOAP
require 'xsd/qname'

# {urn:webservices.bmstu.org}getRequest
class GetRequest
  @@schema_type = "getRequest"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_qualified = "true"
  @@schema_element = [["id", "SOAP::SOAPString"]]

  attr_accessor :id

  def initialize(id = nil)
    @id = id
  end
end

# {urn:webservices.bmstu.org}getResponse
class GetResponse
  @@schema_type = "getResponse"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_qualified = "true"
  @@schema_element = [["object", "Object"]]

  attr_accessor :object

  def initialize(object = nil)
    @object = object
  end
end

# {urn:webservices.bmstu.org}reportGraduatedRequest
class ReportGraduatedRequest
  @@schema_type = "reportGraduatedRequest"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_qualified = "true"
  @@schema_element = [["year", "SOAP::SOAPInt"], ["department", "SOAP::SOAPString"]]

  attr_accessor :year
  attr_accessor :department

  def initialize(year = nil, department = nil)
    @year = year
    @department = department
  end
end

# {urn:webservices.bmstu.org}listStudentsResponse
class ListStudentsResponse
  @@schema_type = "listStudentsResponse"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_qualified = "true"
  @@schema_element = [["student", "Student"]]

  attr_accessor :student

  def initialize(student = nil)
    @student = student
  end
end

# {urn:webservices.bmstu.org}object
class Object
  @@schema_type = "object"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["id", "SOAP::SOAPString"]]

  attr_accessor :id

  def initialize(id = nil)
    @id = id
  end
end

# {urn:webservices.bmstu.org}person
class Person
  @@schema_type = "person"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["id", "SOAP::SOAPString"], ["firstName", "SOAP::SOAPString"], ["fatherName", "SOAP::SOAPString"], ["lastName", "SOAP::SOAPString"], ["birthDate", "SOAP::SOAPDate"], ["gender", "SOAP::SOAPString"]]

  attr_accessor :id
  attr_accessor :firstName
  attr_accessor :fatherName
  attr_accessor :lastName
  attr_accessor :birthDate
  attr_accessor :gender

  def initialize(id = nil, firstName = nil, fatherName = nil, lastName = nil, birthDate = nil, gender = nil)
    @id = id
    @firstName = firstName
    @fatherName = fatherName
    @lastName = lastName
    @birthDate = birthDate
    @gender = gender
  end
end

# {urn:webservices.bmstu.org}student
class Student
  @@schema_type = "student"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["id", "SOAP::SOAPString"], ["firstName", "SOAP::SOAPString"], ["fatherName", "SOAP::SOAPString"], ["lastName", "SOAP::SOAPString"], ["birthDate", "SOAP::SOAPDate"], ["gender", "SOAP::SOAPString"], ["faculty", "SOAP::SOAPString"], ["department", "SOAP::SOAPString"], ["group", "SOAP::SOAPString"], ["ishead", "SOAP::SOAPBoolean"], ["dormitory", "SOAP::SOAPBoolean"], ["chargeable", "SOAP::SOAPBoolean"], ["liabilities", "SOAP::SOAPShort"], ["cardNumber", "SOAP::SOAPString"], ["state", "SOAP::SOAPString"], ["speciality_code", ["SOAP::SOAPString", XSD::QName.new("urn:webservices.bmstu.org", "speciality-code")]], ["passportSeria", "SOAP::SOAPString"], ["passportNumber", "SOAP::SOAPString"], ["passportIssuer", "SOAP::SOAPString"], ["passportDate", "SOAP::SOAPDate"], ["taxpayerIdentity", "SOAP::SOAPString"], ["socialSecurityNumber", "SOAP::SOAPString"], ["healthIsuranceSeria", "SOAP::SOAPString"], ["healthIsuranceNumber", "SOAP::SOAPString"], ["healthIsuranceCompany", "SOAP::SOAPString"], ["stationaryString", "SOAP::SOAPString"], ["stationaryOKATO", "SOAP::SOAPString"], ["temporalString", "SOAP::SOAPString"], ["temporalOKATO", "SOAP::SOAPString"], ["expires", "SOAP::SOAPDate"], ["cellular", "SOAP::SOAPString"], ["phone", "SOAP::SOAPString"], ["citizenship", "SOAP::SOAPString"], ["contractNumber", "SOAP::SOAPString"], ["contractDate", "SOAP::SOAPDate"]]

  attr_accessor :id
  attr_accessor :firstName
  attr_accessor :fatherName
  attr_accessor :lastName
  attr_accessor :birthDate
  attr_accessor :gender
  attr_accessor :faculty
  attr_accessor :department
  attr_accessor :group
  attr_accessor :ishead
  attr_accessor :dormitory
  attr_accessor :chargeable
  attr_accessor :liabilities
  attr_accessor :cardNumber
  attr_accessor :state
  attr_accessor :speciality_code
  attr_accessor :passportSeria
  attr_accessor :passportNumber
  attr_accessor :passportIssuer
  attr_accessor :passportDate
  attr_accessor :taxpayerIdentity
  attr_accessor :socialSecurityNumber
  attr_accessor :healthIsuranceSeria
  attr_accessor :healthIsuranceNumber
  attr_accessor :healthIsuranceCompany
  attr_accessor :stationaryString
  attr_accessor :stationaryOKATO
  attr_accessor :temporalString
  attr_accessor :temporalOKATO
  attr_accessor :expires
  attr_accessor :cellular
  attr_accessor :phone
  attr_accessor :citizenship
  attr_accessor :contractNumber
  attr_accessor :contractDate

  def initialize(id = nil, firstName = nil, fatherName = nil, lastName = nil, birthDate = nil, gender = nil, faculty = nil, department = nil, group = nil, ishead = nil, dormitory = nil, chargeable = nil, liabilities = nil, cardNumber = nil, state = nil, speciality_code = nil, passportSeria = nil, passportNumber = nil, passportIssuer = nil, passportDate = nil, taxpayerIdentity = nil, socialSecurityNumber = nil, healthIsuranceSeria = nil, healthIsuranceNumber = nil, healthIsuranceCompany = nil, stationaryString = nil, stationaryOKATO = nil, temporalString = nil, temporalOKATO = nil, expires = nil, cellular = nil, phone = nil, citizenship = nil, contractNumber = nil, contractDate = nil)
    @id = id
    @firstName = firstName
    @fatherName = fatherName
    @lastName = lastName
    @birthDate = birthDate
    @gender = gender
    @faculty = faculty
    @department = department
    @group = group
    @ishead = ishead
    @dormitory = dormitory
    @chargeable = chargeable
    @liabilities = liabilities
    @cardNumber = cardNumber
    @state = state
    @speciality_code = speciality_code
    @passportSeria = passportSeria
    @passportNumber = passportNumber
    @passportIssuer = passportIssuer
    @passportDate = passportDate
    @taxpayerIdentity = taxpayerIdentity
    @socialSecurityNumber = socialSecurityNumber
    @healthIsuranceSeria = healthIsuranceSeria
    @healthIsuranceNumber = healthIsuranceNumber
    @healthIsuranceCompany = healthIsuranceCompany
    @stationaryString = stationaryString
    @stationaryOKATO = stationaryOKATO
    @temporalString = temporalString
    @temporalOKATO = temporalOKATO
    @expires = expires
    @cellular = cellular
    @phone = phone
    @citizenship = citizenship
    @contractNumber = contractNumber
    @contractDate = contractDate
  end
end

# {urn:webservices.bmstu.org}reportGraduatedPerson
class ReportGraduatedPerson
  @@schema_type = "reportGraduatedPerson"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["id", "SOAP::SOAPString"], ["firstName", "SOAP::SOAPString"], ["fatherName", "SOAP::SOAPString"], ["lastName", "SOAP::SOAPString"], ["profession", "SOAP::SOAPString"], ["professionCode", "SOAP::SOAPString"], ["qualification", "SOAP::SOAPString"], ["qualificationCode", "SOAP::SOAPString"], ["diplomaType", "SOAP::SOAPInt"], ["protocolDate", "SOAP::SOAPDate"], ["protocolNumber", "SOAP::SOAPString"], ["orderNumber", "SOAP::SOAPString"], ["faculty", "SOAP::SOAPString"]]

  attr_accessor :id
  attr_accessor :firstName
  attr_accessor :fatherName
  attr_accessor :lastName
  attr_accessor :profession
  attr_accessor :professionCode
  attr_accessor :qualification
  attr_accessor :qualificationCode
  attr_accessor :diplomaType
  attr_accessor :protocolDate
  attr_accessor :protocolNumber
  attr_accessor :orderNumber
  attr_accessor :faculty

  def initialize(id = nil, firstName = nil, fatherName = nil, lastName = nil, profession = nil, professionCode = nil, qualification = nil, qualificationCode = nil, diplomaType = nil, protocolDate = nil, protocolNumber = nil, orderNumber = nil, faculty = nil)
    @id = id
    @firstName = firstName
    @fatherName = fatherName
    @lastName = lastName
    @profession = profession
    @professionCode = professionCode
    @qualification = qualification
    @qualificationCode = qualificationCode
    @diplomaType = diplomaType
    @protocolDate = protocolDate
    @protocolNumber = protocolNumber
    @orderNumber = orderNumber
    @faculty = faculty
  end
end

# {urn:webservices.bmstu.org}ArrayOfReportGraduatedPerson
class ArrayOfReportGraduatedPerson < ::Array
  @@schema_type = "reportGraduatedPerson"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["reportGraduatedPerson", ["ReportGraduatedPerson[]", XSD::QName.new("urn:webservices.bmstu.org", "reportGraduatedPerson")]]]
end

# {urn:webservices.bmstu.org}ArrayOfStudent
class ArrayOfStudent < ::Array
  @@schema_type = "student"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["student", ["Student[]", XSD::QName.new("urn:webservices.bmstu.org", "student")]]]
end

# {urn:webservices.bmstu.org}listOrderTypes
class ListOrderTypes
  @@schema_type = "listOrderTypes"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = []

  def initialize
  end
end

# {urn:webservices.bmstu.org}orderType
class OrderType
  @@schema_type = "orderType"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["id", "SOAP::SOAPInt"], ["type", "SOAP::SOAPString"]]

  attr_accessor :id
  attr_accessor :type

  def initialize(id = nil, type = nil)
    @id = id
    @type = type
  end
end

# {urn:webservices.bmstu.org}ArrayOfOrderTypes
class ArrayOfOrderTypes < ::Array
  @@schema_type = "orderType"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = [["orderType", ["OrderType[]", XSD::QName.new("urn:webservices.bmstu.org", "orderType")]]]
end

# {urn:webservices.bmstu.org}listOrders
class ListOrders
  @@schema_type = "listOrders"
  @@schema_ns = "urn:webservices.bmstu.org"
  @@schema_element = []

  def initialize
  end
end

# {urn:webservices.bmstu.org}listOrdersResponse
class ListOrdersResponse < ::Array
  @@schema_type = "string"
  @@schema_ns = "http://www.w3.org/2001/XMLSchema"
  @@schema_element = [["order", ["SOAP::SOAPString[]", XSD::QName.new("urn:webservices.bmstu.org", "order")]]]
end
end
