# rotation_2.rb

def rotate_array(array)
  [array[1..-1], array[0]].flatten
end

def rotate_string(string)
  rotate_array(string).join
end

def rotate_rightmost_digits(number, last)
  string_number = number.to_s
  string_number[-last..-1] = rotate_string(string_number[-last..-1])
  string_number.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
