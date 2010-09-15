require 'xmlrpc/client'

require 'data/order/virtualstudentsorder'

$applicant = XMLRPC::Client.new3({
	:port    => 8081,
	:timeout => 300,
}).proxy 'contingent'

class ApplicantsOrder < VirtualStudentsOrder
	TARGET = :applicant
	NEEDS_FACULTY = true

	def search_available params = {}, fields = %w( student_id last_name first_name father_name card_number group_id group )
		return if params.compact.empty? # forbid empty queries

		for key, value in params |= { # add some defaults to params
# 			'faculty'   => Classifier::Faculty[@faculty_id][:code],
			'skip_uuid' => @attributes['students'].collect do |applicant|
				applicant['uuid']
			end # skip applicants who are already in
		} do
			case key
			when /^(.+)_id$/ then
				params[$1] = Classifier[$1][params.delete(key).to_i][:name].to_s.utf_encode
			else
				params[key] = value.utf_encode if value.respond_to? :utf_encode
			end
		end

		for applicant in applicants = $applicant.list_applicants(params.compact) do
			yield *( convert_sql_result({
				# TODO: remember to remove [:id]
				'student_id'  => applicant['uuid'].to_id(true)[:id], # force UUID -> ID conversion
				'last_name'   => applicant['name']['last'].utf_decode,
				'first_name'  => applicant['name']['first'].utf_decode,
				'father_name' => applicant['name']['father'].utf_decode,
				'group_name'  => applicant['group'].utf_decode,
			}, fields) ) if block_given?
		end

		return { :total => applicants.size }
	end

	def add applicant_uuid, paragraph_id = nil, need_sorting = true
		try_to_modify

		# TODO: remember to remove (:applicant)
		applicant = $applicant.get_entity applicant_uuid.to_uuid(:applicant)

		@attributes['students'] << {
			'paragraph_id' => paragraph_id,
			'uuid'         => applicant['uuid'],
			'name' => {
				'last'     => applicant['name']['last'].utf_decode,
				'first'    => applicant['name']['first'].utf_decode,
				'father'   => applicant['name']['father'].utf_decode,
			},
			'birth_date'   => applicant['birth_date'].to_date,
		}.compact

		# Add some values driven by Classifier module
		for field in applicant.keys & %w( gender citizenship faculty ) do
			@attributes['students'].last["#{field}_id"] = Classifier[field][ :name => applicant[field].utf_decode ][:id]
		end

		sort! if need_sorting; save
	end

	alias_method :<<, :add

	##
	# It's assumed that _all_ the applicants are in some paragraph now or _all_ of them are "free".
	def move applicant_ids, paragraph_id
		if @attributes['students'][applicant_ids.first] then # a very simple check
			super
		else
			for applicant_id in applicant_ids do
				add applicant_id, paragraph_id, false # add w/o sorting
			end

			sort!; save
		end
	end

	private

	def _activate
		super

		each_student :all, %w( student_id attributes ) do |student_id, attributes|
			set :student, {
				'student_uuid' => attributes['uuid'],
			}, [ student_id ]
		end
	end
end
