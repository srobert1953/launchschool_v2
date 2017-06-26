# odd.rb

# Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method return true if the number's absolute value is odd.
# You may assume that the argument is a valid integer value.

# Examples:
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# inpout
#  - any integer number
# output
#  - true if the integer is odd
#  - false if integer is even

# non formal pseudo code
#  - make the integer an absolute
#  - check that the remainder of the number divided by 2 is not equal zero
#  - return the result

# BEGIN

# SET number to provided integer
# SET number as absolute
# IF reminder of the integer divided by two equals 0
#   THEN return false
# ELSE
#   THEN return true

# PRINT the result to user

# END

# Version 1:
puts " Version 1 ".center(50, '-')
def is_odd? int
  num = int.abs
  if num % 2 == 0
    return false
  else
    return true
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false

# Version 2:
puts " Version 2 ".center(50, '-')
def is_odd? int
  num = int.abs
  if num.remainder(2) == 0
    return false
  else
    return true
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false

# Version 3: (compact version)
puts " Version 3: (compact version) ".center(50, '-')
def is_odd? int
  int % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
