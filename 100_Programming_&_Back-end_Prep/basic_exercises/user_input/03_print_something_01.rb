# print_something.rb

puts "Do you want me to print something? (y/n)"

answ = gets.chomp.downcase

puts "something" if answ == 'y'
