# number_to_signed_string.rb

def integer_to_string(number)
  string_arr = []
  loop do
    string_arr.unshift(number % 10)
    number = number / 10
    break if number <= 0
  end
  string_arr.join('')
end

def sign(number)
  if number > 0
    '+'
  elsif number < 0
    '-'
  else
    ''
  end
end

def signed_integer_to_string(number)
  number_string = integer_to_string(number.abs)
  case sign(number)
  when '+' then number_string.prepend('+')
  when '-' then number_string.prepend('-')
  else number_string
  end
  number_string
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
