# get_the_sum.rb

loop do
  puts "What does 2 + 2 equal?"
  answer = gets.chomp.to_i
  if answer == 4
    puts "Your answer is correct"
    break
  else
    puts "Please try again"
  end
end
