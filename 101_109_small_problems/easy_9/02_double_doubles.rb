# double_doubles.rb

def twice(number)
  string_number = number.to_s

  half_index = string_number.size / 2
  left_side = string_number[0, half_index]
  right_side = string_number[half_index..-1]

  return number if left_side == right_side
  return number * 2

end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
p twice(0) == 0
