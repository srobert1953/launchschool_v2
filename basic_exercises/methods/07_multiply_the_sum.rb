# multiply_the_sum.rb

def add a, b
  a + b
end

def multiply a, b
  a * b
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36
