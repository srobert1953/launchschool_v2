# practice_problem_08.rb

# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
# => 1
# => 3
# => [3, 4]

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# => 1
# => 2
# => [1, 2]

