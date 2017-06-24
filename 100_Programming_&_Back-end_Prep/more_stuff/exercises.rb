# exercises.rb

# 1. Write a program that checks if the sequence of characters "lab"
# exists in the following strings. If it does exist, print out the word.

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each do |word|
  if word =~ /lab/
    puts word
  else
    puts "#{word} doesn't contain 'lab'"
  end
end

# 2. What will the following program print to the screen? What will it return?

def execute(&block)
  block
end

p execute { puts "Hello from inside the execute method!" }
# => Nothing will be printed. Proc is returned

# 3. What is exception handling and what problem does it solve?
# => Prevents program to terminate

# 4. Modify the code in exercise 2 to make the block execute properly.
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!"}

# 5. Why does the following code...

# def execute(block)
#   block.call
# end

# execute { puts "Hello from inside the execute method!" }

# Give us the following error when we run it?
# block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
# from test.rb:5:in `<main>'
# => the parameter block is missing the & sign
