# perform_again.rb

loop do
  puts "Do you want to do it again?"
  answer = gets.chomp
  break if answer != 'Y'
end
