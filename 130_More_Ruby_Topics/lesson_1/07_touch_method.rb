def select(arr)
  counter = 0
  return_arr = []

  while counter < arr.size
    current_obj = arr[counter]
    return_arr << current_obj if yield(current_obj)

    counter += 1
  end

  return_arr
end

array = [1, 2, 3, 4, 5, 6]

p select(array) { |num| num + 1 }
