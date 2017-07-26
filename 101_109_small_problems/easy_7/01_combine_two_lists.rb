# combine_two_lists.rb

def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |obj, index|
    result << obj
    result << arr2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def interleave_zip(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave_zip([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
