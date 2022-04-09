require_relative 'data/actor'
require_relative 'roles/admin'
require_relative 'roles/user'
require_relative 'context/view_employee_data'

puts 'Use Case: Normal user trying to view sensitive data'

arthur  = Actor.new(id: 42, name: 'Arthur Dent')
context = ViewEmployeeData.new(actor: arthur)

begin
  puts context.view_sensitive_information
rescue => e
  puts e
end

puts '---------------------------------------------------'

puts 'Use Case: Superuser trying to view sensitive data'

zaphod  = Actor.new(id: 1, name: 'Zaphod Beeblebrox')
context = ViewEmployeeData.new(actor: zaphod)

begin
  puts context.view_sensitive_information
rescue => e
  puts e
end
