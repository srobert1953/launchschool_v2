class Pizza
  def initialize(name)
    name = name
  end
end

class Fruit
  def initialize(name)
    @name = name
  end
end

pizza = Pizza.new('Pizza')
fruit = Fruit.new('Fruit')

p pizza.instance_variables
p fruit.instance_variables
