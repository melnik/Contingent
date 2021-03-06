##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForStudyTypeSwitchingOrder
	extend DetailsCommon

	CONDITIONS = [
		DetailsCommon::Condition.new('contract', {"study_type_id"=>Classifier::StudyType::CONTRACT}),
		DetailsCommon::Condition.new('foreign', {"citizenship_id"=>[4, 5, 6, 7]}),
		DetailsCommon::Condition.new('disabled', {"category"=>:disabled})
	]

	def self.has_order?
		true
	end

	def self.init_order(o)
		attributes = o.attributes.dup
		attributes['study_type_id'] = Proc.new { Classifier::StudyType::BUDGET }.call.to_i
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.fix_order(o)
		attributes = o.attributes.dup
		attributes
	end

	def self.render_order(o, tmpl)
		attributes = fix_order(o)
	end

	def self.save_order(o, params)
		attributes = o.attributes.dup
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.has_student?(paragraph)
		[0].member? paragraph
	end
	
	def self.init_student(o, eid, paragraph)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
		end
		o.set_student_attributes(eid, attributes)
	end
	
	def self.fix_student(o, eid, paragraph, attributes)
		attributes = attributes.dup
		case paragraph
		when 0
			attributes['group_id'] ||= Proc.new { Student.load(eid).group.oid }.call.to_i
			attributes['basics'] ||= 1
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.group_id = attributes['group_id']
			tmpl.start_at = attributes['start_at']
			tmpl.basics = attributes['basics']
			case attributes['basics']
			when '1'.to_i
				tmpl.protocol = attributes['protocol']
				tmpl.resolution = attributes['resolution']
			end
			tmpl.assignment = attributes['assignment']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['group_id'] = params["group_id"].to_i
			attributes['start_at'] = params["start_at"].to_d
			attributes['basics'] = params["basics"].to_i
			attributes['protocol'] = nil
			attributes['resolution'] = nil
			case attributes['basics']
			when '1'.to_i
				attributes['protocol'] = Document.new(params["protocol_date"].to_d, params["protocol_num"])
				attributes['resolution'] = Document.new(params["resolution_date"].to_d, params["resolution_num"])
			end
			attributes['assignment'] = Document.new(params["assignment_date"].to_d, params["assignment_num"])
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
