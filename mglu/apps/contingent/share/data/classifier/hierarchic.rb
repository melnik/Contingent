require 'data/classifier/simple'

module Classifier
	private

	class Hierarchic < Simple
		def self.key_postfix
			'code'
		end
		
		def self.load
			entries = []; $sql.execute("SELECT *
			                            FROM #{table_name}
			                            ORDER BY name").fetch do |row|
				entry = { :id   => row[primary_key] }
				row.each_pair do |k, v|
					entry[k.intern] = v unless k == primary_key
				end
				entries << entry
			end
			hash = {}; entries.each do |e| hash[e[:id]] = e end
			
			entries.each do |e|
				if e[:parent_code] then
					e[:parent] = hash[e[:parent_code]]
					(e[:parent][:children] ||= []) << e
					e.delete :parent_code
				else
					e[:level] = 0
					e[:path] = [e[:name]]
				end
			end
			
			level = lambda do |e| prev = level.call(e[:parent]) if e[:parent]; {
				:level     => e[:level]     ||= prev[:level] + 1,
				:path      => e[:path]      ||= prev[:path] + [e[:name]],
				:agreement => e[:agreement] ||= prev[:agreement],
			} end
			entries.each do |e| level.call e end
			
			reorder = lambda do |e| [e] + (e[:children] || []).map(&reorder) end
			entries = entries.reject do |e| e[:level] != 0 end.map do |e| reorder.call(e) end.flatten
			
			Cache[self] = entries
		end
	end
end
