##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForScholarshipAssignmentOrder
	extend DetailsCommon

	CONDITIONS = [
		DetailsCommon::Condition.new('high_courses', {"course"=>[3, 4, 5, 6]}),
		DetailsCommon::Condition.new('contract', {"study_type_id"=>Classifier::StudyType::CONTRACT}),
		DetailsCommon::Condition.new('foreign', {"citizenship_id"=>[4, 5, 6, 7]}),
		DetailsCommon::Condition.new('disabled', {"category"=>:disabled})
	]

	def self.has_order?
		true
	end

	def self.init_order(o)
		attributes = o.attributes.dup
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.fix_order(o)
		attributes = o.attributes.dup
		attributes['term_type'] ||= Proc.new { 'летняя' }.call
		attributes
	end

	def self.render_order(o, tmpl)
		attributes = fix_order(o)
		tmpl.basics = attributes['basics']
		tmpl.term_type = attributes['term_type']
		tmpl.year = attributes['year']
		tmpl.period = attributes['period']
		tmpl.scholarship_1 = attributes['scholarship_1']
		tmpl.scholarship_2 = attributes['scholarship_2']
		tmpl.scholarship_3 = attributes['scholarship_3']
	end

	def self.save_order(o, params)
		attributes = o.attributes.dup
		attributes['basics'] = Document.new(params["basics_date"].to_d, params["basics_num"])
		attributes['term_type'] = params["term_type"]
		attributes['year'] = params["year"]
		attributes['period'] = DateRange.new(params["period_from"].to_d, params["period_till"].to_d)
		attributes['scholarship_1'] = params["scholarship_1"]
		attributes['scholarship_2'] = params["scholarship_2"]
		attributes['scholarship_3'] = params["scholarship_3"]
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.has_student?(paragraph)
		[0, 1, 2].member? paragraph
	end
	
	def self.init_student(o, eid, paragraph)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['scholarship_id'] = 1
		when 1
			attributes['scholarship_id'] = 2
		when 2
			attributes['scholarship_id'] = 2
		end
		o.set_student_attributes(eid, attributes)
	end
	
	def self.fix_student(o, eid, paragraph, attributes)
		attributes = attributes.dup
		case paragraph
		when 0
		when 1
		when 2
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
		when 1
		when 2
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
		when 1
		when 2
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
