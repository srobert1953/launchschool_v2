# problem_07.rb

# What is the block's return value in the following code?
# How is it determined? Also, what is the return value of any?
# in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# => return value of block is true, or false
# => return value of any? is true
# => Output:
# => 1

# Lesson Learned:
# => any? stops evaluating once it finds a true object in a collection
# => It will not evaluate other objects after true is returned from the block
