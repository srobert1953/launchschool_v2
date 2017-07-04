# double_odd_numbers.rb

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    curent_number = numbers[counter]
    curent_number *= 2 if curent_number.odd?
    doubled_numbers << curent_number

    counter += 1
  end

  doubled_numbers
end

nums = [1, 2, 3, 4, 5, 6, 7, 8]

p double_odd_numbers nums

def double_odd_indices(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

p double_odd_indices nums
