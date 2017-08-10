# => This method is the same as in 03_transpose_3_3.rb

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


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
