# odd_list.rb

def oddities(arr)
  odd = []
  arr.each_with_index do |num, idx|
    odd.push(num) if idx.even?
  end
  odd
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

def oddities(arr)
  odd = []
  counter = 0
  loop do
    break if counter >= arr.size
    odd << arr[counter]
    counter += 2
  end
  odd
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

