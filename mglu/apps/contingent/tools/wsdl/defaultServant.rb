require 'default.rb'

class StudentsSrvPort
  # SYNOPSIS
  #   version
  #
  # ARGS
  #   N/A
  #
  # RETURNS
  #   version         String - {http://www.w3.org/2001/XMLSchema}string
  #
  def version()
    p []
    raise NotImplementedError.new
  end

  # SYNOPSIS
  #   get(getRequest)
  #
  # ARGS
  #   getRequest      GetRequest - {urn:webservices.bmstu.org}getRequest
  #
  # RETURNS
  #   getResponse     GetResponse - {urn:webservices.bmstu.org}getResponse
  #
  def get(getRequest)
    p [getRequest]
    raise NotImplementedError.new
  end

  # SYNOPSIS
  #   reportGraduated(reportGraduatedRequest)
  #
  # ARGS
  #   reportGraduatedRequest ReportGraduatedRequest - {urn:webservices.bmstu.org}reportGraduatedRequest
  #
  # RETURNS
  #   reportGraduatedResponse ReportGraduatedResponse - {urn:webservices.bmstu.org}reportGraduatedResponse
  #
  def reportGraduated(reportGraduatedRequest)
    p [reportGraduatedRequest]
    raise NotImplementedError.new
  end

  # SYNOPSIS
  #   listOrderTypes(listOrderTypes)
  #
  # ARGS
  #   listOrderTypes  ListOrderTypes - {urn:webservices.bmstu.org}listOrderTypes
  #
  # RETURNS
  #   listOrderTypesResponse ListOrderTypesResponse - {urn:webservices.bmstu.org}listOrderTypesResponse
  #
  def listOrderTypes(listOrderTypes)
    p [listOrderTypes]
    raise NotImplementedError.new
  end

  # SYNOPSIS
  #   listOrders(listOrders)
  #
  # ARGS
  #   listOrders      ListOrders - {urn:webservices.bmstu.org}listOrders
  #
  # RETURNS
  #   listOrdersResponse ListOrdersResponse - {urn:webservices.bmstu.org}listOrdersResponse
  #
  def listOrders(listOrders)
    p [listOrders]
    raise NotImplementedError.new
  end

  # SYNOPSIS
  #   listStudents(listStudentsRequest)
  #
  # ARGS
  #   listStudentsRequest Map - {http://xml.apache.org/xml-soap}Map
  #
  # RETURNS
  #   listStudentsResponse ListStudentsResponse - {urn:webservices.bmstu.org}listStudentsResponse
  #
  def listStudents(listStudentsRequest)
    p [listStudentsRequest]
    raise NotImplementedError.new
  end
end

