# sum_square_sqaure_sum.rb

def sum_square_difference(num)
  square_of_sum = (1..num).reduce(:+)**2
  sum_of_square = (1..num).map { |n| n** 2 }.reduce(:+)
  square_of_sum - sum_of_square
end

p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(1)
p sum_square_difference(100)
