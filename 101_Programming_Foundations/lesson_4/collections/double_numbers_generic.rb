# double_numbers_generic.rb

def double(numbers, multiplier)
  multpilied = []
  counter = 0

  loop do
    break if counter >= numbers.size

    current_number = numbers[counter]
    multiply = current_number * multiplier
    multpilied << multiply

    counter += 1
  end

  multpilied
end

my_nums = [1, 2, 3, 4, 5, 6, 7, 8]
p double my_nums, 3
