# grocery_list.rb

def buy_fruit(groceries)
  groceries.map { |fruit| [fruit[0]] * fruit[1] }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
