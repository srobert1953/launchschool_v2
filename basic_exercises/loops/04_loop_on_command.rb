# loop_on_command.rb

loop do
  puts "Should I stop looping?"
  answer = gets.chomp.downcase
  break if answer == 'yes'
end
