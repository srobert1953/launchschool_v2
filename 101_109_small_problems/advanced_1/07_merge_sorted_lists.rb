# merge_sorted_lists.rb
def merge(arr1, arr2)
  result = []
  counter = 0

  loop do
    break if append_result!(result, arr1, arr2, counter)
    break if arr1[counter].nil? && arr2[counter].nil?

    reorder_array!(result, arr1[counter])
    reorder_array!(result, arr2[counter])

    counter += 1
  end

  result
end

def reorder_array!(result, number)
  if !result.empty? && result.last > number
    temp = result.last
    result[-1] = number
    result.push(temp)
  else
    result << number
  end
end

def append_result!(result, arr1, arr2, idx)
  if arr1[idx].nil?
    result.concat(arr2[idx..-1]) unless arr2[idx].nil?
  elsif arr2[idx].nil?
    result.concat(arr1[idx..-1]) unless arr1[idx].nil?
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
