# first_to_five.rb

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a < 5 || number_b < 5
  break
end

puts "Number a: #{number_a}"
puts "Number b: #{number_b}"
