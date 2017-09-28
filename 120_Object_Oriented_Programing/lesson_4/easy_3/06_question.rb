class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age = 0
  end

  def make_one_year_older
    @age += 1
  end
end

kitty = Cat.new('Russian blue')
kitty.make_one_year_older
p kitty.age
