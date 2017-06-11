# 1. Write a program called name.rb that asks the user to type in their name
# and then prints out a greeting message with their name included.

puts "Please type your name:"
name = gets.chomp

puts "Welcome #{name}!"

# 2. Write a program called age.rb that asks a user how old they are
# and then tells them how old they will be in 10, 20, 30 and 40 years.

puts "What is your age?"
age = gets.chomp.to_i

puts "You are #{age} years old."
puts "In 10 years, you will be #{age + 10} years old."
puts "In 20 years, you will be #{age + 20} years old."
puts "In 30 years, you will be #{age + 30} years old."

# 3. Add another section onto name.rb that prints the name of the user 10 times.
# You must do this without explicitly writing the puts method 10 times in a row.
# Hint: you can use the times method to do something repeatedly.

10.times { puts name }

# 4. Modify name.rb again so that it first asks the user for their first name,
# saves it into a variable, and then does the same for the last name.
# Then outputs their full name all at once.

puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp

puts "That's better #{first_name} #{last_name}."

# 5. Look at the following programs...
# What does x print to the screen in each case? Do they both give errors?
# Are the errors different? Why?

x = 0
3.times do
  x += 1
end
puts x

# No error, returns => 3
# and...

y = 0
3.times do
  y += 1
  a = y
end
puts a
# Error: exercises.rb:55:in `<main>': undefined local variable or method `a' for main:Object (NameError)
# a is defined within the block and cannot be accessed outside the block.
