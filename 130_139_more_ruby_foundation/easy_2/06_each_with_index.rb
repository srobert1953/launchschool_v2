def each_with_index(array)
  counter = 0

  array.each do |val|
    yield(val, counter)
    counter += 1
  end
end

result = each_with_index([1, 3, 6]) do |num, idx|
  puts "#{idx} -> #{num**2}"
end

p result
