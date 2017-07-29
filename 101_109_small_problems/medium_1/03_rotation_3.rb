# rotation_3.rb
require 'pry'

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

def max_rotation(digit)
  string_digit = digit.to_s.size
  string_digit.downto(2) do |idx|
    digit = rotate_rightmost_digits(digit, idx)
  end
  digit
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
