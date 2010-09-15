##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForMagisterEnrollmentOrder
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
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.fix_order(o)
		attributes = o.attributes.dup
		attributes['study_type_id'] ||= Proc.new { first_value(Classifier::StudyType) }.call
		attributes
	end

	def self.render_order(o, tmpl)
		attributes = fix_order(o)
		tmpl.resolution = attributes['resolution']
		tmpl.approval = attributes['approval']
		tmpl.enrollment_date = attributes['enrollment_date']
		tmpl.study_type_id = attributes['study_type_id']
	end

	def self.save_order(o, params)
		attributes = o.attributes.dup
		attributes['resolution'] = Document.new(params["resolution_date"].to_d, params["resolution_num"])
		attributes['approval'] = Document.new(params["approval_date"].to_d, params["approval_num"])
		attributes['enrollment_date'] = params["enrollment_date"].to_d
		attributes['study_type_id'] = params["study_type_id_id"].to_s.split(':')[0].to_i
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
			attributes['degree_code'] = Proc.new { '68' }.call
		end
		o.set_student_attributes(eid, attributes)
	end
	
	def self.fix_student(o, eid, paragraph, attributes)
		attributes = attributes.dup
		case paragraph
		when 0
			attributes['profession_code'] ||= Proc.new { Student.load(eid).profession_code }.call
			attributes['specialization_code'] ||= Proc.new { '00' }.call
			attributes['country_id'] ||= Proc.new { first_value(Classifier::Country) }.call
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.profession_code = attributes['profession_code']
			tmpl.specialization_code = attributes['specialization_code']
			tmpl.graduation_thesis = attributes['graduation_thesis']
			tmpl.tutor = attributes['tutor']
			tmpl.reference = attributes['reference']
			tmpl.agreement = attributes['agreement']
			tmpl.country_id = attributes['country_id']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['profession_code'] = params["profession_code_code"]
			attributes['specialization_code'] = params["specialization_code"]
			attributes['graduation_thesis'] = params["graduation_thesis"]
			attributes['tutor'] = params["tutor"]
			attributes['reference'] = Document.new(params["reference_date"].to_d, params["reference_num"])
			attributes['agreement'] = Document.new(params["agreement_date"].to_d, params["agreement_num"])
			attributes['country_id'] = params["country_id_id"].to_s.split(':')[0].to_i
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
