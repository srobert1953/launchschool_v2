# insert_numbers.rb

numbers = []

loop do
  puts "Enter any number:"
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end

p numbers
