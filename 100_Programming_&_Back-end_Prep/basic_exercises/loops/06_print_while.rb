# print_while.rb

numbers = []

while numbers.count < 5
  numbers.push(rand(0..99))
end

numbers.each { |number| puts number}
