require 'xsd/qname'

module Progress


# {http://progress.bmstu.ru/}BaseObject
class BaseObject
  attr_accessor :id
  attr_accessor :name

  def initialize(id = nil, name = nil)
    @id = id
    @name = name
  end
end

# {http://progress.bmstu.ru/}Exam
class Exam
  attr_accessor :subjectName
  attr_accessor :mark
  attr_accessor :amountOfHours
  attr_accessor :term
  attr_accessor :testType
  attr_accessor :sessionDelay

  def initialize(subjectName = nil, mark = nil, amountOfHours = nil, term = nil, testType = nil, sessionDelay = nil)
    @subjectName = subjectName
    @mark = mark
    @amountOfHours = amountOfHours
    @term = term
    @testType = testType
    @sessionDelay = sessionDelay
  end
end

# {http://progress.bmstu.ru/}Mark
class Mark
  attr_accessor :id
  attr_accessor :name
  attr_accessor :exams

  def initialize(id = nil, name = nil, exams = [])
    @id = id
    @name = name
    @exams = exams
  end
end

# {http://progress.bmstu.ru/}Classifier
class Classifier
  attr_accessor :id
  attr_accessor :name
  attr_accessor :code

  def initialize(id = nil, name = nil, code = nil)
    @id = id
    @name = name
    @code = code
  end
end

# {http://progress.bmstu.ru/}getRequest
class GetRequest
  attr_accessor :id

  def initialize(id = nil)
    @id = id
  end
end

# {http://progress.bmstu.ru/}getResponse
class GetResponse
  attr_accessor :marks

  def initialize(marks = nil)
    @marks = marks
  end
end

# {http://progress.bmstu.ru/}listMarksRequest
class ListMarksRequest
  attr_accessor :group

  def initialize(group = nil)
    @group = group
  end
end

# {http://progress.bmstu.ru/}listMarksResponse
class ListMarksResponse < ::Array
end

# {http://progress.bmstu.ru/}listClassifierRequest
class ListClassifierRequest
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end
end

# {http://progress.bmstu.ru/}listClassifierResponse
class ListClassifierResponse < ::Array
end


end

require 'soap-client/progress/mapping_registry'
require 'soap-client/progress/driver'
