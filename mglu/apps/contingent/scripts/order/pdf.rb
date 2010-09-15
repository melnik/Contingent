require 'auth'
#auth_user_current.require_permissions('order_project')

require 'data/order'

# TODO: find a better place for them
require 'document'
require 'daterange'

require 'interface/order/details'

oid = get_values['order_id'].to_i
part = get_values['part']

system("/usr/local/bin/khtml-pdf http://contingent.bmstu.ru/order/print_version.rb?order_id=#{oid}")

pdf = File.open('/tmp/khtml/1.pdf').read

response.header['Content-Type'] = 'application/pdf'
response.header['Content-Disposition'] = "inline; filename=order_#{oid}.pdf"
print pdf
