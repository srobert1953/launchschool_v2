# sum_or_product.rb

def compute_sum(number)
  (1..number).to_a.inject(:+)
end

def compute_product(number)
  (1..number).to_a.inject(:*)
end

integer = nil
loop do
  puts ">> Please enter an integer greater than 0."
  integer = gets.chomp.to_i
  break if integer > 0
  puts "Please enter a positive integer greater than 0"
end

choice = nil
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product"
  choice = gets.chomp
  break if (choice == 's' || choice == 'p')
  puts "Please enter 's' for sum or 'p' for product"
end

if choice == 's'
  sum = compute_sum(integer)
  puts "The sum of the integers between 1 and #{integer} is #{sum}"
elsif choice == 'p'
  product = compute_product(integer)
  puts "The product of the integers between 1 and #{integer} is #{product}"
else
  puts "Ugh Uh, the operation is unknown..."
end
