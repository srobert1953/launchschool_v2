# fibonacci_2.rb

def fibonacci(number)
  # => return 1 if number is 1 or two
  return 1 if number <= 2

  # => create a register where computed Fibonacci numbers will be temporarily stored
  first_register = 1
  scond_register = 1

  # => set a range from 3 up until number and iterate over the range
  # => with each iteration, add the current numbers in register
  # => resign the second register with the result
  # => resign the second resister to the first register
  # => return second register

  (3..number).each do |number|
    first_register, scond_register = scond_register, first_register + scond_register
  end

  scond_register
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501
