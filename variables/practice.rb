# Practice sheet

hash = {}

puts "Please enter your name: "
name = gets.chomp
puts "Please enter your age: "
age = gets.chomp.to_i
puts "Please enter your city: "
city = gets.chomp
puts "Please enter your country: "
country = gets.chomp

hash[:name] = name
hash[:age] = age
hash[:city] = city
hash[:country] = country

hash.each { |key, value| puts key.to_s.capitalize + ": " + value.to_s }
