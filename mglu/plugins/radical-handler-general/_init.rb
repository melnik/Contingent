require 'GeneralHandler'
Radical::HandlersList['general']=Proc.new do |params|
   Radical::Handlers::GeneralHandler.new(params)
end
