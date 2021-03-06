##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForKeepDownOrder
	extend DetailsCommon

	CONDITIONS = [
		DetailsCommon::Condition.new('contract_now', {"student:citizenship_id"=>[1, 2, 3], "student:study_type_id"=>Classifier::StudyType::CONTRACT}),
		DetailsCommon::Condition.new('transition', {"order:transition"=>1}),
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
		attributes['transition'] ||= 0
		attributes['study_type_id'] ||= Proc.new { first_value(Classifier::StudyType) }.call
		attributes['study_form_id'] ||= Proc.new { first_value(Classifier::StudyForm) }.call
		attributes
	end

	def self.render_order(o, tmpl)
		attributes = fix_order(o)
		tmpl.transition = attributes['transition']
		tmpl.study_type_id = attributes['study_type_id']
		tmpl.study_form_id = attributes['study_form_id']
	end

	def self.save_order(o, params)
		attributes = o.attributes.dup
		attributes['transition'] = params["transition"].to_i
		attributes['study_type_id'] = params["study_type_id_id"].to_s.split(':')[0].to_i
		attributes['study_form_id'] = params["study_form_id_id"].to_s.split(':')[0].to_i
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
			attributes['term_count'] ||= Proc.new { '' }.call
			attributes['change_speciality'] ||= 0
			attributes['profession_code'] ||= Proc.new { Student.load(eid).profession_code }.call
			attributes['degree_code'] ||= Proc.new { Student.load(eid).degree_code }.call
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.group_id = attributes['group_id']
			tmpl.term_count = attributes['term_count']
			tmpl.change_speciality = attributes['change_speciality']
			case attributes['change_speciality']
			when '0'.to_i
			when '1'.to_i
				tmpl.profession_code_1 = attributes['profession_code']
				tmpl.degree_code_1 = attributes['degree_code']
			end
			tmpl.start_at = attributes['start_at']
			tmpl.agreement = attributes['agreement']
			tmpl.additional_agreement = attributes['additional_agreement']
			tmpl.liabilities = attributes['liabilities']
			tmpl.deadline = attributes['deadline']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['group_id'] = params["group_id"].to_i
			attributes['term_count'] = params["term_count"]
			attributes['change_speciality'] = params["change_speciality"].to_i
			attributes['profession_code'] = nil
			attributes['degree_code'] = nil
			case attributes['change_speciality']
			when '0'.to_i
			when '1'.to_i
				attributes['profession_code'] = params["profession_code_1_code"]
				attributes['degree_code'] = params["degree_code_1_code"]
			end
			attributes['start_at'] = params["start_at"].to_d
			attributes['agreement'] = Document.new(params["agreement_date"].to_d, params["agreement_num"])
			attributes['additional_agreement'] = Document.new(params["additional_agreement_date"].to_d, params["additional_agreement_num"])
			collect_row = Proc.new { |index|
				row = {}
				row['subject'] = params["liabilities_subject_#{index}"]
				row['type'] = params["liabilities_type_#{index}"]
				row
			}
			attributes['liabilities'] = []
			i = 0
			while (keep = params["keep_liabilities_#{i}"])
				attributes['liabilities'] << collect_row.call(i) if keep == '1'
				i += 1
			end
			attributes['liabilities'] << collect_row.call('new') if params['keep_liabilities_new'] == '1'
			attributes['deadline'] = params["deadline"].to_d
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
