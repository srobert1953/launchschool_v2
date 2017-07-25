# fibonacci_location.rb

def find_fibonacci_index_by_length(length)
  first = 1
  second = 1
  fibonacci_number = first + second
  index = 3
  until fibonacci_number.to_s.size >= length
    first = second
    second = fibonacci_number
    fibonacci_number = first + second
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

def find_fibonacci_index_by_length(length)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= length

    first = second
    second = fibonacci
  end

  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
