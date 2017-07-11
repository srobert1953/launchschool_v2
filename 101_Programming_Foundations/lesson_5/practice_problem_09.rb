# practice_session_09.rb

# Given this data structure, return a new array of the same
# structure but with the sub arrays being ordered
# (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

ordered = arr.map do |sub_arr|
  sub_arr.sort { |a, b| b <=> a }
end

p ordered
