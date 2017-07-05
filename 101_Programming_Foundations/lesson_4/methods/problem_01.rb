# problem_01.rb

# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# => return value is the original collection as the last value 'hi' in the block
# => is considered 'truthy' witch evaluates every object in the collection
# => as true
