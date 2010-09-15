require 'data/classifier/simple'

module Classifier
	private

	class Coded < Simple
		def self.load
			entries = []; $sql.execute("SELECT #{primary_key} AS id, name, code
			                            FROM #{table_name}
			                            ORDER BY name").fetch do |row|
				entries << {
					:id   => row['id'].to_i,
					:name => row['name'],
					:code => row['code'],
				}
			end; Cache[self] = entries
		end
	end
end
