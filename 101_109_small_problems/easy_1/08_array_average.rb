# array_average.rb

# Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array.
# The array will never be empty and the numbers
# will always be positive integers.

# Examples:

# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40
# The tests above should print true.

# take an array of integers
# set an integer equal to 0
# iterate over the array
#   add the current value to initial integer
# once done divide the initial integer by count of array objects

def average(arr)
  int = 0
  arr.each { |num| int += num }
  int / arr.length.to_f
end

puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
