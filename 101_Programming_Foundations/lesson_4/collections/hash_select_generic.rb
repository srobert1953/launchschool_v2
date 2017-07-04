# hash_select_generic.rb

def general_select(hash_products, select_criteria)
  products = hash_products.keys
  selected_products = {}
  counter = 0

  loop do
    break if counter >= products.size

    current_product = products[counter]
    type = hash_products[current_product]

    if type == select_criteria
      selected_products[current_product] = select_criteria
    end

    counter += 1
  end

  selected_products
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p general_select produce, "Vegetable"
