# loop_modify.rb

arr = ['apple', 'banana', 'pineapple']
modified = []
counter = 0

loop do
  current_fruit = arr[counter]

  modified << current_fruit + "s"

  counter += 1
  break if counter == arr.size
end

p modified
p arr
