require 'data/order'
require 'data/student'
require 'data/applicant'

RETURN_FIELDS = {
	:applicant => %w( applicant_id last_name first_name father_name faculty_id group ),
	:student   => %w( student_id last_name first_name father_name group_id card_number category study_type student_state dormitory ),
	:order     => %w( order_id number faculty order_type date_created date_activated ),
}

RETURN_TABLES = {
	:applicant => %w(  ), # subset of Applicant::TABLES
	:student   => %w( common ), # subset of Student::TABLES
}

FORCE_CRITERIA = {
	:order => {
		:order_status_id => Classifier::OrderStatus::ACTIVATED,
	},
}

def prepare obj, parent_entity
	case obj
	when Hash then
		hash = {}; for key, value in obj do
			case key
			when /^(#{parent_entity}_|o)id$/ then
				hash['uuid']       = value.to_uuid(parent_entity)
			when /^(#{$UUID_MAPPING_PREFIX.keys.join '|'})_id$/ then
				hash["#{$1}_uuid"] = value.to_uuid($1.to_sym)
			when /^(.+)_id$/ then
				hash[$1] = if classifier = Classifier["#{parent_entity}_#{$1}"] then
					classifier[value][:name]
				else
					"ID:#{value}"
				end
			when 'status', 'date_created' then
			else
				if ( value_entity = value.class.to_s.downcase.to_sym ).in? $UUID_MAPPING_PREFIX then
					hash["#{key}_uuid"] = value.oid.to_uuid(value_entity)
				else
					hash[key] = prepare value, key
				end
			end unless value.empty?
		end; hash.compact
	when Array then
		obj.collect do |element|
			prepare element, parent_entity
		end.compact
	when Document then
		prepare obj.to_h(true), parent_entity
	when Department, Faculty, User then # to be removed from Contingent
		obj.to_s
	else
		obj
	end
end

def add_list_handler target, return_fields
	help = <<-HELP
DESCRIPTION:
	Method searches and returns information about #{target}s matching given filters
INPUT:
	* struct of search filters
OUTPUT:
	* array of structs, each representing a short #{target} description
	HELP

	server.add_handler "contingent.list_#{target}s", %w( array struct ), help do |criteria|
		for key, value in criteria do # pre-filter
			case key when /_id$/ then criteria.delete key end
		end

		for key, value in criteria do # filter itself
			case key
			when /^(skip_)?uuid$/ then
				criteria["#{$1}#{target}_id"] = case value
				when Array then
					criteria.delete(key).collect do |uuid|
						uuid.to_id[:id]
					end
				else
					criteria.delete(key).to_id[:id]
				end
			when /^(#{$UUID_MAPPING_PREFIX.keys.join '|'})_uuid$/ then
				criteria["#{$1}_id"] = criteria.delete(key).to_id[:id]
			else
				case value
				when XMLRPC::DateTime then
					criteria[key] = value.to_date.to_d
				when String then
					criteria[key] = value.utf_decode
				end
			end
		end

		list = []; Kernel.const_get(target.to_s.capitalize).list criteria | FORCE_CRITERIA[target], return_fields do |*fields|
			hash = {}; for key in return_fields do
				case key
				when /^(last|first|father)_name$/ then
					( hash['name'] ||= {} )[$1] = fields[return_fields.index(key)]
				else
					hash[key] = fields[return_fields.index(key)]
				end
			end; list << prepare(hash, target)
		end; list
	end
end

def add_get_handler
	help = <<-HELP
DESCRIPTION:
	Method returns full information about an entity with given UUID
INPUT:
	* entity's UUID
OUTPUT:
	* struct representing a full entity description
	HELP

	server.add_handler 'contingent.get_entity', %w( struct string ), help do |uuid|
		if local_id = uuid.to_id then
			prepare Kernel.const_get(local_id[:entity].to_s.capitalize).load(local_id[:id], RETURN_TABLES[local_id[:entity]]).to_h(true), local_id[:entity]
		end
	end
end

def _init server
	for target, return_fields in RETURN_FIELDS do
		add_list_handler target, return_fields
	end

	add_get_handler
end
