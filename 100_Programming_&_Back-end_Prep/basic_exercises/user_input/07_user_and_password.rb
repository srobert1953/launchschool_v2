# user_and_password.rb

PASSWORD = 'pass'
USERNAME = 'robert'

loop do
  puts ">> Please enter your username:"
  user = gets.chomp
  puts ">> Please enter your password:"
  password = gets.chomp
  break if PASSWORD == password && USERNAME == user
  puts "Authorization failed!"
end

puts "Welcome!"
