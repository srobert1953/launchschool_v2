# double_doubles.rb

def double_number?(number)
  string_number = number.to_s
  half_size = string_number.size / 2
  string_number[0, half_size] == string_number[half_size..-1]
end

def twice(number)
  double_number?(number) ? number : number * 2
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
