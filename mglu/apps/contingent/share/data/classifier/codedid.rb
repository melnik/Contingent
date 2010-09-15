require 'data/classifier/coded'

module Classifier
	private

	class CodedID < Coded
		def self.key_postfix
			'code'
		end

		def self.load
			entries = []; $sql.execute("SELECT #{primary_key} AS code, name
			                            FROM #{table_name}
			                            ORDER BY name").fetch do |row|
				entries << {
					:id   => row['code'],
					:name => row['name'],
					:code => row['code'],
				}
			end; Cache[self] = entries
		end
	end
end
