# calculator.rb

# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
# no need for validation

Kernel.puts("Please enter the first number:")
number1 = Kernel.gets().chomp()

Kernel.puts("Please enter the second number:")
number2 = Kernel.gets().chomp()

Kernel.puts("Please choose a n operation: 1) add, 2) subtract 3) multiply, 4) divide")
operation = Kernel.gets().chomp()

if operation == "1"
  result = number1.to_i() + number2.to_i()
elsif operation == "2"
  result = number1.to_i() - number2.to_i()
elsif operation == "3"
  result = number1.to_i() - number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

puts "The result is #{result}"

