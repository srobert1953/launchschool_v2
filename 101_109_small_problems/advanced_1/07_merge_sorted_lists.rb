# merge_sorted_lists.rb

=begin
input: two sorted arrays
output: new array
  merge sorted array of the input arrays

I cannot merge the arrays and then sort it.

define method merge with two parameters
compare which array's size is biggest
  assign the biggest array to variable biggest_array
?????


=end


def merge(arr1, arr2)
  new = arr1 + arr2
  new.min(new.size)
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
