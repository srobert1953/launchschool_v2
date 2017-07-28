# always_negative.rb

def negative(number)
  number <= 0 ? number : -number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
