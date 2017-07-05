# problem_03.rb

# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# => My guess: it is [nil, nil, nil]
# => But in fact it is [1, 2, 3]
