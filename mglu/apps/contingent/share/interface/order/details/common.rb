
require 'empty'

module DetailsCommon

	class Condition
		def initialize(name, condition)
			@name = name
			@condition = condition
		end

		attr_accessor :name

		def student_vars
			@condition.keys.grep(/^(student:)?[^:]*$/).collect { |k| k.gsub(/^student:/, '') }
		end

		def check(attrs)
			@condition.each_pair { |k,v|
				if k == 'eval' then
					return false unless eval("lambda { #{v} }").call(attrs)
				elsif k =~ /:/ then
					type, name = k.split(':')
					return false if !compare(attrs[type][name], @condition[k])
				else
					return false if !compare(attrs['order'][k] || attrs['student'][k], @condition[k])
				end
			}
			true
		end

		private

		def compare(value, ethalon)

			if value.is_a? String and ethalon.is_a? Symbol
				ethalon = ethalon.to_s
			end

			check = lambda { |cond|
				begin
					cond.call
				rescue
					false
				end
			}

			check.call(lambda { (ethalon.respond_to?(:include?) && ethalon.include?(value)) }) ||
			check.call(lambda { (value.respond_to?(:include?)   && value.include?(ethalon)) }) ||
			(ethalon === value)
		end
	end


	def first_value(classifier)
		classifier.new.each { |item| return item[:id] }
	end


	def student_vars
		student_vars = const_get(:CONDITIONS).inject([]) { |a,c| a + c.student_vars }.uniq
	end

	def student_conditions(o, s)
		order_attrs = o.attributes | o.get_student_attributes(s.oid)
		student_attrs = {}
		student_vars.each { |v| student_attrs[v] = s.send(v) if s.respond_to? v }


		student_attrs['group'] = student_attrs['group'].name if student_attrs.has_key?('group')

		attrs = {'order' => order_attrs, 'student' => student_attrs}

		res = {}
		const_get(:CONDITIONS).each { |c|
			res[c.name] = c.check(attrs)
		}

		res
	end


	def order_conditions(o)
		res = {}
		conditions = const_get(:CONDITIONS)
		conditions.each { |c| res[c.name] = false }

		order_attrs = o.attributes
		sv = student_vars + ['attributes']

		o.each_student(:all, sv) { |*args|
			student_attrs = {}
			(0...(sv.length)).each { |i| student_attrs[sv[i]] = args[i] }

			attrs = {'order' => order_attrs | student_attrs['attributes'], 'student' => student_attrs }
			conditions.each { |c|
				res[c.name] ||= c.check(attrs)
			}
		}

		res
	end
end
