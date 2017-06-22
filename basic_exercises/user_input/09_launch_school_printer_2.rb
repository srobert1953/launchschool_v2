# launch_school_printer.rb

loop do
  puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit)"
  input = gets.chomp.upcase
  break if input == 'Q'

  lines = input.to_i

  if lines >= 3
    lines.times { puts "Launch School is the best!" }
  else
    puts "That's not enough lines!"
  end
end
