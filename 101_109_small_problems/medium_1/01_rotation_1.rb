# rotation_1.rb

# => Doesn't handle empty array
def rotate_array(array)
  [array[1..-1], array[0]].flatten
end

# Launch School Solution

# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
# p rotate_array([]) == []

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]

def rotate_string(string)
  rotate_array(string).join
end

p rotate_string('') == ''
p rotate_string('String') == 'tringS'

def rotate_number(number)
  rotate_array(number.to_s).join.to_i
end

p rotate_number(12) == 21
p rotate_number(3456) == 4563
