def reduce(arr, default = 0)
  counter = 0
  acumulator = default

  while counter < arr.size
    acumulator = yield(acumulator, arr[counter])

    counter += 1
  end

  acumulator
end

arr = [1, 2, 3, 4, 5]

p reduce(arr) { |acc, num| acc + num }

