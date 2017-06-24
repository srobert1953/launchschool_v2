# more_methods.rb

def add a, b
  a + b
end

def substract a, b
  a - b
end

def multiply a, b
  a * b
end

p add 2, 3
p substract 3, 2

p multiply(add(2, 3), substract(multiply(2, 5), substract(10, 2)))
