# squaring_argument.rb

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(4) == 16
p square(-9) == 81
