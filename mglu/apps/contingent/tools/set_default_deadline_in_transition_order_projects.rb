#!/usr/bin/env ruby

require "#{Dir.pwd.gsub(/\/apps.*$/, '')}/apps/contingent/tools/context"

Order.list({:order_status_id => Classifier::OrderStatus::PROJECT, :order_type_id => TransitionOrder.type_id}, %w(order_id)) do |id| (o = Order.load(id)).each_student 1, %w(student_id attributes) do |id, a| a['deadline'] ||= '2008-02-20'.to_date; o.set_student_attributes id, a end end
