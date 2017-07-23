# number_to_string.rb

def integer_to_string(number)
  string_arr = []
  loop do
    string_arr.unshift(number % 10)
    number = number / 10
    break if number <= 0
  end
  string_arr.join('')
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
