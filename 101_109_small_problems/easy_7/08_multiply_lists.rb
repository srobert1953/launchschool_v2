# multiply_lists.rb

def multiply_list(arr1, arr2)
  multiplied_array = []
  arr1.each_with_index do |num, index|
    multiplied_array << num * arr2[index]
  end

  multiplied_array
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list(arr1, arr2)
  product = []
  arr1.zip(arr2) { |arr| product << arr[0] * arr[1] }
  product
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
