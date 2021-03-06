##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForBachelorGraduationOrder
	extend DetailsCommon

	CONDITIONS = [
		DetailsCommon::Condition.new('contract', {"study_type_id"=>Classifier::StudyType::CONTRACT}),
		DetailsCommon::Condition.new('foreign', {"citizenship_id"=>[4, 5, 6, 7]}),
		DetailsCommon::Condition.new('disabled', {"category"=>:disabled})
	]

	def self.has_order?
		false
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
			attributes['mark'] ||= 4
			attributes['diploma_type'] ||= 1
			attributes['qualification'] ||= Proc.new { 'бакалавр техники и технологии' }.call
			attributes['country_id'] ||= Proc.new { first_value(Classifier::Country) }.call
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.graduation_thesis = attributes['graduation_thesis']
			tmpl.mark = attributes['mark']
			tmpl.diploma_type = attributes['diploma_type']
			tmpl.qualification = attributes['qualification']
			tmpl.protocol = attributes['protocol']
			tmpl.agreement = attributes['agreement']
			tmpl.country_id = attributes['country_id']
			tmpl.passport = attributes['passport']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['graduation_thesis'] = params["graduation_thesis"]
			attributes['mark'] = params["mark"].to_i
			attributes['diploma_type'] = params["diploma_type"].to_i
			attributes['qualification'] = params["qualification"]
			attributes['protocol'] = Document.new(params["protocol_date"].to_d, params["protocol_num"])
			attributes['agreement'] = Document.new(params["agreement_date"].to_d, params["agreement_num"])
			attributes['country_id'] = params["country_id_id"].to_s.split(':')[0].to_i
			attributes['passport'] = params["passport"]
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
