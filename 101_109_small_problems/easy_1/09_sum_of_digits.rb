# sum_of_digits.rb

# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# Examples:
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

def sum(num)
  num.to_s.split('').inject(0) do |total, num|
    total + num.to_i
  end
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
