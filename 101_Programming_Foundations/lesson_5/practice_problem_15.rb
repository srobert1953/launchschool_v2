# problem_practice_15.rb

# Given this data structure write some code to return an array
# which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_arr = arr.select do |hash|
  hash.all? do |_,sub_arr|
    sub_arr.all? { |int| int.even? }
  end
end

p even_arr
