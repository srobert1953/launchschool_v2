# class_methods.rb

class GoodDog
  @@number_of_dogs = 0

  def initialize
    @@number_of_dogs += 1
  end

  def self.who_am_i
    "I am a GoodDog class"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.who_am_i

sparky = GoodDog.new
dog2 = GoodDog.new
puts GoodDog.total_number_of_dogs
puts sparky

