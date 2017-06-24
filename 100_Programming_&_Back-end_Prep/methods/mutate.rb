# mutating.rb

def some_method number
  puts "Getting number: #{number}"
  original_number = number
  number = 7
  puts "Number #{original_number} resigned to #{number}."
end

a = 5
some_method a
puts "Number passed to the method: #{a}"

arr = [1, 2, 3]

def mutate array
  array.pop
end

puts "Before mutate method #{arr}"
mutate arr
puts "After mutate method #{arr}"

def no_mutate array
  array.last
end

second_arr = [4, 5, 6]

puts "Before no_mutate method: #{second_arr}"
no_mutate second_arr
puts "After no_mutate method: #{second_arr}"
