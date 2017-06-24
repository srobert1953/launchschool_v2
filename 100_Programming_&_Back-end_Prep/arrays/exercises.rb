# exercises.rb

# 1. Below we have given you an array and a number.
# Write a program that checks to see if the number appears in the array.
arr = [1, 3, 5, 7, 9, 11]
number = 3

p arr.include? number

# 2. What will the following programs return? What is value of arr after each?
arr = ["b", "a"]
arr = arr.product(Array(1..3))
arr.first.delete(arr.first.last)
# => returned: 1
# => arr = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)
# => returned: [1, 2, 3]
# => arr = [["b"], ["a", [1, 2, 3]]]

# 3. How do you print the word "example" from the following array?

arr = [["test", "hello", "world"],["example", "mem"]]
p arr[1][0]

# 4. What does each method return in the following example?

arr = [15, 7, 18, 5, 12, 8, 5, 1]

# p arr.index(5)
# => error

# p arr.index[5]
# => error

#p arr[5]
# => 8

# 5. What is the value of a, b, and c in the following program?
string = "Welcome to America!"
a = string[6]
b = string[11]
c = string[19]
# => a = 'e' ; b = 'A'; c = nil
p a, b, c

# 6. You run the following code...
names = ['bob', 'joe', 'susan', 'margaret']
# names['margaret'] = 'jody'
# ...and get the following error message:
# TypeError: no implicit conversion of String into Integer
#   from (irb):2:in `[]='
#   from (irb):2
#   from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
# => 'margaret' in place of an integer. Not sure what was intention to do with this maybe assignment or a change of value

# Correct version:
names[3] = 'jody'

# 7. Write a program that iterates over an array and builds a new array
# that is the result of incrementing each value in the original array
# by a value of 2.
# You should have two arrays at the end of this program,
# The original array and the new array you've created.
# Print both arrays to the screen using the p method instead of puts.

arr = [1, 2, 3, 4, 5, 6]
new_arr = arr.map { |item| item + 2 }
p arr
p new_arr

