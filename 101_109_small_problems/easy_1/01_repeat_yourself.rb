# repeat_yourself.rb

# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.
#
# Example:
# repeat('Hello', 3)
#
# Output:
# Hello
# Hello
# Hello

# - input
#   - a string, a positive integer
#   - need check for positive integer?
#   - need check for string? / empty string?
# - output
#   - print the string times integer
#   - failure notification?

# Test Cases
# repeat("", 0)       => "Incorrect input"
# repeat("", -1)      => "Incorrect input"
# repeat("", "3")     => "Incorrect input"
# repeat("", "-2")    => "Incorrect input"
# repeat("", 1)       => "The string is empty"
# repeat("Hello", 2)  => "Hello"
#                     => "Hello"

def repeat(string, integer)
  unless integer.to_i > 0 || integer.is_a?(Integer)
    puts "Incorrect input"
    return
  end
  if string.empty?
    puts "The string is empty"
    return
  end
  integer.times { puts "#{string}"}
end

repeat("", 0)
repeat("", -2)
repeat("", "3")
repeat("", "-2")
repeat("", 1)
repeat("Hello!", 2)
