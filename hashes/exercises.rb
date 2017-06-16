# exercesises.rb

# 1. Given a hash of family members, with keys as the title
# and an array of names as the values, use Ruby's built-in select method
# to gather only immediate family members' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

close_family = family.select { |key, value| key == :sisters || key == :brothers }
p close_family.values.flatten

# 2. Look at Ruby's merge method. Notice that it has two versions.
# What is the difference between merge and merge!?
# Write a program that uses both and illustrate the differences.

person = { name: "Robert", age: 31, city: "Prague"}
school = { name: "Technical University", city: "Kosice", country: "Slovakia"}

merge_hash = person.merge school
p merge_hash

# person.merge! school
# p person

keep_old_values =  person.merge(school) { |key, old, new| old }
puts "Old values:"
p keep_old_values
# => merge doesn't change the original hash. merge! is destructive and changes the original hash

# 3. Using some of Ruby's built-in Hash methods, write a program that loops through
# a hash and prints all of the keys.
# Then write a program that does the same thing except printing the values.
# Finally, write a program that prints both.

school = { name: "Technical University", city: "Kosice", country: "Slovakia"}

puts "All keys from school hash: "
school.each_key { |key| puts key.to_s}

puts "All values from school hash: "
school.each_value { |val| puts val.to_s}

puts "Entire school hash:"
school.each { |key, val| puts "#{key.to_s}: #{val.to_s}"}

# 4. Given the following expression, how would you access the name of the person?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

p person[:name]

# 5. What method could you use to find out if a Hash contains a specific value in it?
# Write a program to demonstrate this use.

school = { name: "Technical University", city: "Kosice", country: "Slovakia"}
# Values:
p school.has_value? "Kosice"

# Keys:
p school.fetch :name, "There is no specified key"
p school.has_key? :name
p school.include? :city

# 6. Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams.
# Anagrams are words that have the same exact letters in them but
# in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

anagrams = {}
words.each do |word|
  placeholder = word.split("").sort.join

  if anagrams.has_key? placeholder
    anagrams[placeholder] << word
  else
    anagrams[placeholder] = [word]
  end
end

anagrams.each_value { |val| puts "#{val}"}

# 7. Given the following code...
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
# What's the difference between the two hashes that were created?

# => my_hash key is a symbol, whereas my_hash2 key is a string

# 8. If you see this error, what do you suspect is the most likely problem?
# NoMethodError: undefined method `keys' for Array
# => a method keys were used on array object. Arrays don't support method keys.
# => B
















