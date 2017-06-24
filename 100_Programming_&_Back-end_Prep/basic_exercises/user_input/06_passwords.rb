PASSWORD = 'PaSSwOOrDD'

# loop do
#   puts ">> Please enter your password:"
#   password = gets.chomp
#   if PASSWORD == password
#     puts 'Welcome!'
#     break
#   else
#     puts "Invalid password, please try again!"
#   end
# end

# Launch School solution:
puts " Launch School solution ".center(50, '-')

loop do
  puts ">> Please enter your password:"
  password = gets.chomp
  break if PASSWORD == password
  puts "Invalid password, please try again!"
end

puts "Welcome!"
