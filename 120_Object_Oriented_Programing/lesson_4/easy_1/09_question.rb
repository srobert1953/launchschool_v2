class Cat
  attr_accessor :type, :age

  @@cats_count = 0

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

kitty = Cat.new('kitty')
p Cat.cats_count
