=begin
input: a nested array
  outer array with 3 inner arrays, each holding 3 objects
  [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
  ]

output: a new nested array
  transposed array
  [
  [1, 4, 3],
  [5, 7, 9],
  [8, 2, 6]
  ]

transpose of the array as:
indexes will be moved as follow:
[0][0] => [0][0]
[1][0] => [0][1]
[2][0] => [0][2]

[2][1] => [1][2]
[2][2] => [2][2]

[1][1] => [1][1]

set result as an empty array
insert inner empty arrays as many times as many object in 0 index inner array
iterate over the outer array
  in each iteration, get inner array
    iterate over the inner array and place the element to the index of first iteration to the empty array
=end

def transpose(array)
  result = []
  array[0].size.times { result << [] }
  array.each_with_index do |inner, outer_idx|
    inner.each_with_index do |element, inner_idx|
      result[inner_idx][outer_idx] = element
    end
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

