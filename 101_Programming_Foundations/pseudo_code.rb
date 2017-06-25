# pseudo_code.rb

# Determine the greatest number in a collection.

# - input
#   - an array of numbers
#   - no empty array allowed
# - output
#   - an integer of the greatest number

# Examples
# arr = [4, 2, 65, 42, 34]
# Output
# 65

# Non formal pseudo code

# check the array is not empty
# iterate over the collection one by one
#   - save the first value as a starting value
#   - with each iteration compare the current value with saved value
#   - if the saved value is greater or equal
#     - leave the save value as is
#   - otherwise, if saved value is lower than current value
#     - assign current value to the saved value
#  after iterating over the collection return the saved value

#  Formal pseudo code
#  START

#  IF array empty
#    Notify about the error
#  SET saved_value = first value in array
#  SET iterator = 1

#  WHILE iterator < length of numbers
#   IF saved_value >= iterator value
#     do nothing and co to next iteration
#   ELSE
#     SET saved_value = iterator value

#   SET iterator  = iterator + 1

# PRINT saved_value

# END

# Code:

arr = [4, 2, 65, 42, 34]
arr = []

def greatest_number arr
  return "The array is empty" if arr.empty?

  greatest_num = arr.first

  arr.each do |num|
    if greatest_num >= num
      next
    else
      greatest_num = num
    end
  end
  greatest_num
end

puts greatest_number arr

#### Pseudo code practice ####

# 1. A method that returns a sum of two integers

# take two integers
#   - add the two integers
#   - return the sum

# 2. A method that takes an array of strings, and returns a string that is all those strings concatenated together

# set an intial string to nil
# iterate over an array of string
#   - append the initial string with current string
#   - return the initial string

# 3. a method that takes an array of integers, and returns a new array with every other element

# set a new empty array
# set a counter
# iterate over an array of integers
#   - if counter is odd skip iteration
#   - add one to counter with each iteration
#   - return the new empty array





