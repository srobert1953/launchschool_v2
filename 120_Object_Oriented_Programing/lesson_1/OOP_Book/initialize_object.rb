# good_dog.rb

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, w, h)
    @name = n
    @weight = w
    @height = h
  end

  def speak
    "#{name} says Arf!"
  end

  def change_info(n, w, h)
    self.name = n
    self.weight = w
    self.height = h
  end

  def info
    "#{name} weights #{weight} and is #{height} tall."
  end
end

sparky = GoodDog.new("Sparky", "12 inches", "10 lb")
puts sparky.info
sparky.change_info("Spartacus", "11 inches", "11 lb")
puts sparky.info

