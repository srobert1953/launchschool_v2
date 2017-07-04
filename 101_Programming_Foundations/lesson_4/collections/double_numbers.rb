# double_numbers.rb

def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    doubled = numbers[counter] * 2
    doubled_numbers << doubled

    counter += 1
  end

  doubled_numbers
end

p double_numbers [1, 2, 3, 4, 5 ,6]


def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter >= numbers.size

    numbers[counter] *= 2

    counter += 1
  end
end

numbers = [3, 2, 6, 1]
double_numbers! numbers
p numbers
