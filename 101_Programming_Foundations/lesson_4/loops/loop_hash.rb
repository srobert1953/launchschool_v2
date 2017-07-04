# loop_hash.rb

number_of_pets = {
  'dogs' => 2,
  'cats' => 2,
  'fish' => 1
}

pets = number_of_pets.keys
counter = 0

loop do
  break if counter >= pets.size
  pet = pets[counter]
  pet_number = number_of_pets[pet]
  puts "I have #{pet_number} #{pet}!"
  counter += 1
end

