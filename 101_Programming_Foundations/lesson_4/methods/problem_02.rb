# problem_02.rb

# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2

# => count treats the given block that it only will count elements
# => from the collection if the blocks return value is true for each object
# => in the collection.
