# how_many.rb

# Write a method that counts the number of occurrences of each element
# in a given array.

# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
# 'motorcycle', 'motorcycle', 'car', 'truck']
# count_occurrences(vehicles)

# Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# create an empty hash
# loop through the collection of strings
# if current value exists in the hash
#   increase value in hash by 1 for key
# otherwise set new key with current value equal to 1
# print the hash

def count_occurrences(array)
  occurences = {}
  array.each do |element|
    if occurences.key?(element)
      occurences[element] += 1
    else
      occurences[element] = 1
    end
  end

  occurences.each { |key, value| puts "#{key}: #{value}" }
end

vehicles = %w(car
              car
              truck
              car
              SUV
              truck
              motorcycle
              motorcycle
              car
              truck)

count_occurrences vehicles

puts ' Launch School version '.center(35, '-')

def count_occurences(array)
  occurences = {}
  array.each do |element|
    occurences[element] = array.count(element)
  end

  occurences.each { |key, value| puts "#{key}: #{value}" }
end

count_occurrences vehicles
