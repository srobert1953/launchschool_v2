# stringy_strings.rb

# Write a method that takes one argument, a positive integer,
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'
# The tests above should print true.

# take an integer
# set counter to 1
# crete an empty string
# start to iterate
# if counter is odd, add 1 to empt string
# else add 0 to emtpty string
# increase counter by one with each itteration
# stop iterate when counter is equal to integer
# return the string

def stringy(int)
  counter = 0
  string = ''
  loop do
    string << (counter.even? ? '1' : '0').to_s
    counter += 1
    break if counter == int
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts ' Re-factored code with alternate argument '.center(40, '-')

def stringy_2(int, alter = 1)
  string = ''
  if alter.zero?
    int.times { |num| string << (num.even? ? '0' : '1').to_s }
  else
    int.times { |num| string << (num.even? ? '1' : '0').to_s }
  end
  string
end

puts stringy_2(6, 0)
puts stringy_2(9, 0)
puts stringy_2(4)
puts stringy_2(7)
