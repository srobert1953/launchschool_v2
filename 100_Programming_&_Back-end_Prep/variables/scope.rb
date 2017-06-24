# scope.rb

# Variable is accessible within the block '{}, or do/end' if declared outside of it. Variable declared within a block is not accessible outside of it.

# Variable is not accessible within the method if declared outside or vice versa

# Variable declared outside f loop is accessible within the loop and vice versa

# Block scope
a = 5

3.times do |n|
  a = 3
  b = 4
  puts "#{n}. a = #{a}, b = #{b}"
end

puts "Block var a: " + a.to_s
# puts "Block var b: #{b}" # not declared outside of the .times block

# Method scope
x = 5

def print_variable var
  # puts x # Variable not declared within the method.
  puts "Method var x: var"
end

print_variable x

# Loop scope

arr = [55, 56, 57]

for i in arr do
  a = i
end

puts "For loop a: #{a}"

a = 0
while a < arr.length
  b = arr[a]
  puts "#{a}. While loop inner b: #{b}"
  a += 1
end

puts "While loop b: #{b}"
