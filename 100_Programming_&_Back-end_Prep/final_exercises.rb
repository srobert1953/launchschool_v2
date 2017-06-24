# final_exercises.rb

# 1. Use the each method of Array to iterate over
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
puts "Exercise 1:"
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |num| puts num }

# 2. Same as above, but only print out values greater than 5.
puts ""
puts "Exercise 2:"
arr.each { |num| puts num if num > 5 }

# 3. Now, using the same array from #2, use the select method to extract
# all odd numbers into a new array.
puts ""
puts "Exercise 3:"
odd_arr = arr.select { |num| num.odd? }
p odd_arr

# 4. Append "11" to the end of the original array. Prepend "0" to the beginning.
puts ""
puts "Exercise 4"
arr.push 11
arr.unshift 0
p arr

# 5. Get rid of "11". And append a "3".
puts ""
puts "Exercise 5:"
arr.pop
arr.push 3
p arr

# 6. Get rid of duplicates without specifically removing any one value
puts ""
puts "Exercise 6:"
p arr.uniq

# 7. What's the major difference between an Array and a Hash?
# => Array is an ordered list whereas Hash is unordered, so with Array we can be certain that the objects are still at the same position, where with hash we look for an object based on a key.

# 8. Create a Hash using both Ruby syntax styles.
puts ""
puts "Exercise 8:"
hash_1 = Hash.new()
hash_1[:name] = "Robert"
hash_1[:age] = 31
p hash_1
p hash_2 = {name: "Robert", age: 31}
p hash_3 = {:name => "Robert", :age => 31}

# 9. Suppose you have a hash h = {a:1, b:2, c:3, d:4}
#   1. Get the value of key `:b`
#   2. Add to this hash the key:value pair `{e:5}`
#   3. Remove all key:value pairs whose value is less than 3.5
puts ""
puts "Exercise 9.1:"
h = {a:1, b:2, c:3, d:4}
p h[:b]

puts "Exercise 9.2:"
h[:e] = 5
p h

puts "Exercise 9.3:"
h.each { |key, value| h.delete key if value < 3.5 }
p h

# 10. Can hash values be arrays? Can you have an array of hashes? (give examples)
# => Yes, and Yes
puts ""
puts "Exercise 10:"
p hash = {arr1: [1, 2, 3], arr2: [4, 5, 6], arr3: [7, 8, 9]}
p arr = [{a: 1, b: 2}, {c: 3, d: 4}, {e: 5, f: 6}]

# 11. Look at several Rails/Ruby online API sources and say
# which one you like best and why.
# => I think official ruby-doc.org API source is the best for now.

# 12. Given the following data structures. Write a program that moves
# the information from the array into the empty hash
# that applies to the correct person.
puts ""
puts "Exercise 12:"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:adress] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:adress] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

p contacts

# 13. Using the hash you created from the previous exercise,
# demonstrate how you would access Joe's email and Sally's phone number?
puts ""
puts "Exercise 13:"
p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

# 14. In exercise 12, we manually set the contacts hash values one by one.
# Now, programmatically loop or iterate over the contacts hash from exercise 12,
# and populate the associated data from the contact_data array.
# Hint: you will probably need to iterate over ([:email, :address, :phone]),
# and some helpful methods might be the Array shift and first methods.

# Note that this exercise is only concerned with dealing with 1 entry
# in the contacts hash, like this:
puts ""
puts "Exercise 14:"
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
info = [:email, :adress, :phone]

info.each do |i|
  contacts["Joe Smith"][i] = contact_data[info.index i]
end

p contacts

contacts.each do |name, hash|
  info.each do |field|
    hash[field] = contact_data[info.index field]
  end
end

p contacts

puts ""
puts "Exercise 14 Extra:"
puts "Not solved..."

# 15. Use Ruby's Array method delete_if and String method start_with?
# to delete all of the words that begin with an "s" in the following array.
puts ""
puts "Exercise 15:"

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |val| val.start_with? 's'}
p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |val| val.start_with?('s', 'w') }
p arr

# 16. Take the following array:
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
# and turn it into a new array that consists of strings containing one word.
# (ex. ["white snow", etc...] → ["white", "snow", etc...].
# Look into using Array's map and flatten methods,
# as well as String's split method.
puts ""
puts "Exercise 16:"
b = a.map { |val| val.split(" ")}.flatten
p b

# 17. What will the following program output?
puts ""
puts "Exercise 17:"
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
# => These hashes are the same!
















