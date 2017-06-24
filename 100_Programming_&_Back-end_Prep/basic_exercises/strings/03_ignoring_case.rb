# ignoring_case.rb

name = "Roger"

puts name.downcase == "RoGeR".downcase
puts name.downcase == "DAVE".downcase

puts " Launch School Solution ".center(50, '-')

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0
