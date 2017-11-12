def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

each([1, 2, 3, 4, 5]) { |num| puts num }

def each_with_index(arr)
  counter = 0

  while counter < arr.size
    yield(arr[counter], counter)
    counter += 1
  end

  arr
end

my_arr = [1, 43, 2, 63, 643, 0]
odd_numbers = []

each(my_arr) do |num|
  odd_numbers << num if num.odd?
end

p odd_numbers
