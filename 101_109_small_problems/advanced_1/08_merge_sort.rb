# merge_sort.rb

=begin
input: an array
output: sorted array

merge sort the array by breaking the array into sub arrays and then recombining the sub-arrays back sorting it as we go.

break the array into sub-arrays until each sub-array contains one element

get half of the array and insert into new array, get second half of the array and insert into new array
repeat if the sub-arrays have more than one element


=end

def sort(arr1, arr2)
  new_arr = arr1 + arr2
  new_arr.min(new_arr.size)
end

def merge_sort(array)
  return array if array.size == 1

  array_part_1 = array[0, array.size / 2]
  array_part_2 = array[array.size / 2..-1]

  array_part_1 = merge_sort(array_part_1)
  array_part_2 = merge_sort(array_part_2)

  sort(array_part_1, array_part_2)
end

p merge_sort([9, 5, 8, 4, 6])
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie))
p merge_sort([7, 3, 9, 15, 23, 1])
