# good_dog_class.rb

module Walkable
  def walk
    "I am walking"
  end
end

module Swimable
  def swim
    "I can swim"
  end
end

module Climable
  def climb
    "I am climbing"
  end
end

class Animal
  include Walkable

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def speak
    "Hello"
  end
end

class GoodDog < Animal
  include Swimable
  include Climable

  attr_accessor :color

  def initialize(color, name)
    super(name)
    self.color = color
  end

  def speak
    super + " #{self.name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new('brown', 'Sparky')
paws = Cat.new('red')

puts sparky.speak
puts paws.speak
p GoodDog.ancestors
