# reversed_arrays_1.rb

def reverse!(array)
  counter = 0
  while counter < array.size / 2
    array[counter], array[-counter-1] = array[-counter-1], array[counter]
    counter += 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []
