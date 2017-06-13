# exercises.rb

# 1. Write a program that prints a greeting message.
# This program should contain a method called greeting that takes a name
# as its parameter and returns a string.

def greeting name
  "Hello #{name}, Welcome!"
end

p greeting "Robert"

# 2. What do the following expressions evaluate to?
# x = 2
# => 2

# puts x = 2
# => nil

# p name = "Joe"
# => "Joe"

# four = "four"
# => "four"

# print something = "nothing"
# => nil

# 3. Write a program that includes a method called multiply
# that takes two arguments and returns the product of the two numbers.
def multiply num1, num2
  num1 * num2
end

p multiply 8, 5

# 4. What will the following code print to the screen?
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")
# => nil

# 5. 1) Edit the method in exercise #4 so that it does print words on the screen.
#    2) What does it return now?
def scream words
  puts words + "!!!!!"
end

scream "Yippeee"
# => nil

# 6. What does the following error message tell you?
# ArgumentError: wrong number of arguments (1 for 2)
#   from (irb):1:in `calculate_product'
#   from (irb):4
#   from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'
# => method calculate_product expects two arguments, but it is given only one.
