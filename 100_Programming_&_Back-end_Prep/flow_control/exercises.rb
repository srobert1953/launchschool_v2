# exercises.rb

# 1. Write down whether the following expressions return true or false.
# Then type the expressions into irb to see the results.
p (32 * 4) >= 129
# => false
p false != !true
# => false
p true == 4
# => false
p false == (847 == '874')
# => true
p (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
# => true

# 2. Write a method that takes a string as argument.
# The method should return the all-caps version of the string,
# only if the string is longer than 10 characters.
# Example: change "hello world" to "HELLO WORLD".

def to_allcaps word
  if word.length > 10
    puts word.upcase
  else
    puts word
  end
end

puts "Write something:"
response = gets.chomp

to_allcaps response

# 3. Write a program that takes a number from the user between 0 and 100
# and reports back whether the number is between 0 and 50, 51 and 100, or above 100

puts "Enter some number:"
number = gets.chomp.to_i

if number >= 0 && number <= 50
  puts "The number is between 0 - 50."
elsif number >= 51 && number <= 100
  puts "The number is between 51 - 100."
else
  puts "Please enter number between 0 to 100."
end

# 4. What will each block of code below print to the screen?
# Write your answer on a piece of paper or in a text editor
# and then run each block of code to see if you were correct.

'4' == 4 ? puts("TRUE") : puts("FALSE")
# => FALSE

x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
 puts "Did you get it right?"
else
 puts "Did you?"
end
# => Did you get it right?

y = 9
x = 10
if (x + 1) <= (y)
 puts "Alright."
elsif (x + 1) >= (y)
 puts "Alright now!"
elsif (y + 1) == x
 puts "ALRIGHT NOW!"
else
 puts "Alrighty!"
end
# => Alright now!

# 5. Rewrite your program from exercise 3 using a case statement.
# Wrap the statement from exercise 3 in a method and wrap this new case
# statement in a method. Make sure they both still work.

def zero_to_hundred number
  case
  when number < 0
    "Please enter number between 0 to 100."
  when number <= 50
    "The number is between 0 - 50."
  when number <= 100
    "The number is between 51 - 100."
  else
    "Please enter number between 0 to 100."
  end
end

puts zero_to_hundred number

# 6. When you run the following code...

# def equal_to_four(x)
#   if x == 4
#     puts "yup"
#   else
#     puts "nope"
# end

# equal_to_four(5)
# You get the following error message..
# test_code.rb:96: syntax error, unexpected end-of-input, expecting keyword_end
# Why do you get this error and how can you fix it?

# => The if statement/ or method equal_to_four has no end keyword. Add the end keyword before/ or after end already in the program.

def equal_to_four x
  if x == 4
    puts "yup"
  else
    puts "nope"
  end
end
equal_to_four 5




