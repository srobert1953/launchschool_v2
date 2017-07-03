# question_01.rb

# What do you expect to happen when the greeting variable is
# referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# => An error that variable or method is not declared <- Incorrect answer
# => greeting variable will be assigned as nil, even when inside an if statement
# => which evaluates to false.
