# multiply_all_pairs.rb

def multiply_all_pairs(arr1, arr2)
  product = arr1.product arr2
  product.map! { |combo| combo[0] * combo[1] }
  product.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
