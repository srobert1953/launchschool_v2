# odd_numbers.rb

numbers = (1..99).to_a

counter = numbers.size - 1

loop do
  puts numbers[counter] if numbers[counter].odd?

  break if counter == 0
  counter -= 1
end
