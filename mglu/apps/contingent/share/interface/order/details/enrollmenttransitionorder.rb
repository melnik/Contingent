##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForEnrollmentTransitionOrder
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
		attributes['student_state_id'] = Proc.new { Classifier::StudentState::STUDYING }.call.to_i
		attributes.each_pair { |k,v| o.attributes[k] = v }
		o.save
	end

	def self.fix_order(o)
		attributes = o.attributes.dup
		attributes['study_type_id'] ||= Proc.new { Classifier::StudyType::BUDGET }.call
		attributes['study_form_id'] ||= Proc.new { Classifier::StudyForm::FULLTIME }.call
		attributes['degree_code'] ||= Proc.new { first_value(Classifier::Degree) }.call
		attributes
	end

	def self.render_order(o, tmpl)
		attributes = fix_order(o)
		tmpl.resolution = attributes['resolution']
		tmpl.enrollment_date = attributes['enrollment_date']
		tmpl.from = attributes['from']
		tmpl.study_type_id = attributes['study_type_id']
		tmpl.study_form_id = attributes['study_form_id']
		tmpl.degree_code = attributes['degree_code']
	end

	def self.save_order(o, params)
		attributes = o.attributes.dup
		attributes['resolution'] = Document.new(params["resolution_date"].to_d, params["resolution_num"])
		attributes['enrollment_date'] = params["enrollment_date"].to_d
		attributes['from'] = params["from"]
		attributes['study_type_id'] = params["study_type_id_id"].to_s.split(':')[0].to_i
		attributes['study_form_id'] = params["study_form_id_id"].to_s.split(':')[0].to_i
		attributes['degree_code'] = params["degree_code_code"]
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
			attributes['gender_id'] ||= Proc.new { 1 }.call
			attributes['citizenship_id'] ||= Proc.new { 1 }.call
			attributes['profession_code'] ||= Proc.new { first_value(Classifier::Profession) }.call
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.name = attributes['name']
			tmpl.gender_id = attributes['gender_id']
			tmpl.birth_date = attributes['birth_date']
			tmpl.citizenship_id = attributes['citizenship_id']
			tmpl.from = attributes['from']
			tmpl.card_number = attributes['card_number']
			tmpl.group_id = attributes['group_id']
			tmpl.agreement = attributes['agreement']
			tmpl.profession_code = attributes['profession_code']
			tmpl.liabilities = attributes['liabilities']
			tmpl.deadline = attributes['deadline']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			attributes['name'] = {
				'first' => params["name_first"],
				'last' => params["name_last"],
				'father' => params["name_father"]
			}
			attributes['gender_id'] = params["gender_id_id"].to_s.split(':')[0].to_i
			attributes['birth_date'] = params["birth_date"].to_d
			attributes['citizenship_id'] = params["citizenship_id_id"].to_s.split(':')[0].to_i
			attributes['from'] = params["from"]
			attributes['card_number'] = params["card_number"]
			attributes['group_id'] = params["group_id"].to_i
			attributes['agreement'] = Document.new(params["agreement_date"].to_d, params["agreement_num"])
			attributes['profession_code'] = params["profession_code_code"]
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
