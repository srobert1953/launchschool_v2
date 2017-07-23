# convert_string_to_signed_num.rb

def digits(ch)
  chars = {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    '0' => 0
  }
  chars[ch]
end

def string_to_integer(str)
  arr = str.split('')
  arr.map! { |char| digits(char) }

  number = 0
  arr.each { |num| number = 10 * number + num }
  number
end

def remove_sign(string)
  if (string[0] == '-' || string[0] == '+')
    string[1..-1]
  else
    string
  end
end

def string_to_signed_integer(string)
  integer = string_to_integer(remove_sign(string))
  if string[0] == '-'
    -integer
  else
    integer
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
