module Flyable
  def fly
    "I'm flying!"
  end
end

module Singable
  def sing
    "I can sing"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
  include Singable
end

bird1 = Bird.new('red')
bird1.color
p Bird.ancestors
# => Bird, Singable, Flyable, Animal
