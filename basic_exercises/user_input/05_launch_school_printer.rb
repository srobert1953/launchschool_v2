# launch_school_printer.rb

loop do
  puts ">> How many output lines do you want? Enter a number >= 3"
  lines = gets.chomp.to_i
  if lines >= 3
    lines.times { puts "Launch School is the best!" }
    break
  else
    puts "That's not enough lines!"
  end
end
