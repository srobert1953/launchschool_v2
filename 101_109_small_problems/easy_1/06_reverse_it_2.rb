# reverse_it_2.rb

# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with all five or more letter words reversed.
# Each string will consist of only letters and spaces. Spaces should be
# included only when more than one word is present.

# Examples:

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

# make an array from string
# iterate through the array collection
#   if current word length is greater then 5
#     reverse the letter order
# after iterate make a string from the array

def reverse_words(string)
  array = string.split
  array.map! do |word|
    word.length >= 5 ? word.reverse : word
  end
  array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
