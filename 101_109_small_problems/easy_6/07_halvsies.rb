# halvsies.rb

def halvsies(array)
  split_index = (array.size / 2.0).round
  [array[0, split_index], array[split_index..-1]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
