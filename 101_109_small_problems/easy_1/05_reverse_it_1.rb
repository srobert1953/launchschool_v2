# reverse_it_1.rb

# Write a method that takes one argument, a string, and returns the same
# string with the words in reverse order.

# Examples:

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# set an empty array
# make an array from the string
# take last object from the string array
# push the object to the empty array
# create a string from empty array

def reverse_sentence(string)
  reverse = []
  array_string = string.split
  until array_string.empty?
    last_object = array_string.pop
    reverse.push(last_object)
  end
  reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts ' One Line solution '.center(40, '-')

def reverse_sentence_2(string)
  string.split.reverse.join(' ')
end

puts reverse_sentence_2('') == ''
puts reverse_sentence_2('Hello World') == 'World Hello'
puts reverse_sentence_2('Reverse these words') == 'words these Reverse'
