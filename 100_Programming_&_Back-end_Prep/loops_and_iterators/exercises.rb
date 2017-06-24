# exercises.rb

# 1. What does the each method in the following program return
# after it is finished executing?
x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end
# => [1, 2, 3, 4, 5]
# => #<Enumerator: [1, 2, 3, 4, 5]:each>

# 2. Write a while loop that takes input from the user, performs an action,
# and only stops when the user types "STOP". Each loop can get info from the user.

puts "Type something:"
input = gets.chomp.upcase

while input != 'STOP'
  case input
  when "SOMETHING"
    puts "Very clever!"
  when "NOTHING"
    puts "Smart-ass"
  else
    puts "Don't like the game? Type 'STOP'!"
  end
  puts "Write something again:"
  input = gets.chomp.upcase
end

# 3. Use the each_with_index method to iterate through an array of your
# creation that prints each index and value of the array.

arr = ["Robert", "Alexandra", "Peter", "Danka", "Daniel", "Stanislav"]

arr.each_with_index { |value, index| puts "#{index}. #{value}"}

# 4. Write a method that counts down to zero using recursion.

def countdown num
  if num <= 0
    puts "Happy New Year!"
  else
    puts num
    countdown(num - 1)
  end
end

countdown 10
countdown -3
