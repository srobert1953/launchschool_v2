# Practice sheet

hash = Hash.new

puts "What is your name?"
name = gets.chomp
puts "What is your age?"
age = gets.chomp.to_i
puts "What city do you live in?"
city = gets.chomp
puts "And which country?"
country = gets.chomp

hash[:city] = city
hash[:name] = name
hash[:age] = age
hash[:country] = country

hash.each { |key, value| puts "#{key.to_s.capitalize}: #{value}"}
