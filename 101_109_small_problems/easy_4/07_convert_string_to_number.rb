# convert_string_to_number.rb

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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
