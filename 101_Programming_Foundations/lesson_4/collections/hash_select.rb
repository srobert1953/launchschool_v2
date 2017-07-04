# hash_select.rb

def select_fruit(hash)
  # Create an array from keys
  # Iterate over the array with loop
  #   set current value to variable
  #   check if hash key of current value equals 'Fruit'
  #   if yes, insert to an empty hash

  hash_keys = hash.keys
  fruits = {}

  counter = 0

  loop do
    break if counter >= hash_keys.length

    curent_fruit = hash_keys[counter]
    if hash[curent_fruit] == 'Fruit'
      fruits[curent_fruit] = 'Fruit'
    end

    counter += 1
  end

  fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


p select_fruit produce
