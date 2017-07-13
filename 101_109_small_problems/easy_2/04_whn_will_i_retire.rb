# when_will_i_retire.rb

puts "What is our age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement = gets.chomp.to_i

time_stamp = Time.new
current_year = time_stamp.year
retire_year = (retirement - age) + current_year
left_years = retire_year - current_year

puts "It's #{current_year}. You will retire in #{retire_year}!"
puts "You have only #{left_years} years left."
