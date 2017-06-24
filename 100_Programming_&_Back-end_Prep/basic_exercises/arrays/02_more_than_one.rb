# more_than_one.rb

pets = ["cat", "dog", "fish", "lizard"]

my_pets = []
my_pets << pets[2] << pets[3]

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

puts ""
puts " Launch School Solution ".center(50, '-')
puts ""

my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"


