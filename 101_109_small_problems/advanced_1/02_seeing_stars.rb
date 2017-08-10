=begin
input: number
  integer greater than 7, and is always odd number
output: a string representing a star like:
  *  *  *
   * * *
    ***
  *******
    ***
   * * *
  *  *  *

The star is made of asterisks: '*'
each row has 3 *, except the middle which has as many stars as the given number
rows have as many places as given number

first   row has * at index 0, and -1, and middle index
second  row has * at index 1, and -2, and middle index
third   row has * at index 2, and -3, and middle index
until given number divided by 2

middle row, which is number divided by 2 plus 1 has all * at every index

=end

def first_half(width, middle)
  result = ""
  middle.times do |idx|
    position = (0...width).to_a.map { |n| ' ' }
    position[idx] = '*'
    position[middle] = '*'
    position[width - idx - 1] = '*'
    result << position.join + "\n"

  end

  result
end

def second_half(width, middle)
  result = ""
  (middle-1).downto(0) do |idx|
    position = (0...width).to_a.map { |n| ' ' }
    position[idx] = '*'
    position[middle] = '*'
    position[width - idx - 1] = '*'
    result << position.join + "\n"
  end

  result
end

def star(size)

  middle = size / 2

  puts first_half(size, middle)
  puts '*' * size
  puts second_half(size, middle)

end

# star 7
star 9
