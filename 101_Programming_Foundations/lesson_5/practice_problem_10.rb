# practice_problem_10.rb

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

return_arr = arr.map do |sub_hash|
  sub_hash.map do |key,val|
    [key, val += 1]
  end
end

incremented_arr = []
return_arr.each { |val| incremented_arr << val.to_h }
p incremented_arr

puts " Launch School solution ".center(40, '-')

ls_solution = arr.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

p ls_solution
