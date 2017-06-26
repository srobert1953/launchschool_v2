# list_of_digits.rb

# Write a method that takes one argument, a positive integer, and returns a list
# of the digits in the number.

# Examples:

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# input
#  - integer
#  - check for the integer?
# output
#  - a collection of digits from the integer
#  - digits are in sort order as they are in the integer
#  - no error/exception is specified with incorect input

# Pseudo

# - take integer value
# - create an empty collection
# - onvert the integer into string
# - split the string to individual numbers and save to the collection
# - convert the returned value back to integer

# BEGIN

# GET integer
# SET the integer to string
# SET an empty array
# SET the empty array to split string
# SET the returned array to integer values
# PRINT the array to user

# END

def digit_list(int)
  int_arr = int.to_s.split('')
  int_arr.map! { |val| val.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

