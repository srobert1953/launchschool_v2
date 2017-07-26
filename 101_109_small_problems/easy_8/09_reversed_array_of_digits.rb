# reversed_array_of_digits.rb

def reversed_number(number)
  result = 0
  loop do
    number, reminder = number.divmod(10)
    result = result * 10 + reminder
    break if number <= 0
  end

  result
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
p reversed_number(0) == 0

# Ruby way one-liner

def reversed_number(number)
  number.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
p reversed_number(0) == 0
