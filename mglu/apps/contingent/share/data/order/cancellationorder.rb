require 'data/order/orderorder'

class CancellationOrder < OrderOrder
	TYPE = 'Об отмене приказа'
	PARAGRAPH_NAME = [ 'Отменить приказ' ]

	public_class_method :new

	private

	def _activate
		super

		each_student 0, %w( student_id ) do |student_id|
			@order.rollback_student student_id
		end
	end

	undef_method :rollback_student # TODO: add self#rollback_student

	def _rollback
		super
	end

	def try_to_activate
		##
		# Проверка приказа на возможность отмены
		unless @order.respond_to? :rollback_student then
			if @auto_fix then
				delete
			else
				raise error(:activation, false), "приказ \"#{@order.class::TYPE}\" не может быть отменен"
			end
		end if full?

		super
	end
end
