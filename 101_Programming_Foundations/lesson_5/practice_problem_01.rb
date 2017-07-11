# practice_problem_01.rb

# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

ordered = arr.sort do |str1, str2|
  str2.to_i <=> str1.to_i
end

p ordered
