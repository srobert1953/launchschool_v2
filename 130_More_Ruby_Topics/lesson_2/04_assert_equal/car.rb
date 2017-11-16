# car.rb

class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end
