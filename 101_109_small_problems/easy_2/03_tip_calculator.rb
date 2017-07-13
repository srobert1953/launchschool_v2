# tip_calculator.rb

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_rate = gets.chomp.to_f

tip_amount = ((bill * tip_rate) / 100).round(2)
total_amount = (tip_amount + bill).round(2)

tip_amount = format('%.2f', tip_amount)
total_amount = format('%.2f', total_amount)

puts "The tip is $#{tip_amount}"
puts "The total is $#{total_amount}"
