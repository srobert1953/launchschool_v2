# conditionals.rb

puts "Put in a number:"
number = gets.chomp.to_i

if number == 3
  puts "Your number is 3"
elsif number == 5
  puts "Your number is 5"
else
  puts "Your number didn't win!"
end

if number == 0 then puts "What is this?" end
puts "You entered 6" if number == 6
puts "You shouldn't enter anything greater than 10" unless number < 10

#Ternary operator
puts 5 > 6 ? "5 is more than 6" : "5 is less then 6"
p true ? "I am young!" : "I am old."
