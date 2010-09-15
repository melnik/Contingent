module Classifier
	private

	class Simple < Basic
		def self.key_postfix
			'id'
		end

		def self.load
			entries = []; $sql.execute("SELECT #{primary_key} AS id, name
			                            FROM #{table_name}
			                            ORDER BY name").fetch do |row|
				entries << {
					:id   => row['id'].to_i,
					:name => row['name'],
				}
			end; Cache[self] = entries
		end
	end
end
