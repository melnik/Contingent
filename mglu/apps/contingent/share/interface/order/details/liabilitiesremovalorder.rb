##
## Generated by details-generator. Do not edit!
##

require 'interface/order/details/common'
require 'expression'

class DetailsForLiabilitiesRemovalOrder
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
		attributes['liabilities'] = Proc.new {  }.call.to_s
		attributes['hide_study_type'] = 1
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
		end
		attributes
	end
	
	def self.render_student(o, eid, paragraph, tmpl)
		attributes = fix_student(o, eid, paragraph, o.get_student_attributes(eid))
		case paragraph
		when 0
			tmpl.liabilities_list = attributes['liabilities_list']
		end
	end
	
	def self.save_student(o, eid, paragraph, params)
		attributes = o.get_student_attributes(eid)
		case paragraph
		when 0
			collect_row = Proc.new { |index|
				row = {}
				row['subject'] = params["liabilities_list_subject_#{index}"]
				row['type'] = params["liabilities_list_type_#{index}"]
				row
			}
			attributes['liabilities_list'] = []
			i = 0
			while (keep = params["keep_liabilities_list_#{i}"])
				attributes['liabilities_list'] << collect_row.call(i) if keep == '1'
				i += 1
			end
			attributes['liabilities_list'] << collect_row.call('new') if params['keep_liabilities_list_new'] == '1'
		end
		o.set_student_attributes(eid, attributes)
	end

	def self.has_group?(paragraph)
		[].member? paragraph
	end
end
