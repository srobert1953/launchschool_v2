# exercises.rb

class MyCar
  attr_accessor :color, :model
  attr_reader :year

  def self.gas_mileage(liters, kilometers)
    puts "#{kilometers / liters} kilometers per liter."
  end

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def to_s
    "This is: #{self.color} #{self.model} from #{self.year}"
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} km/h."
  end

  def break(number)
    @speed -= number
    puts "You push the break and decelerate #{number} km/h"
  end

  def current_speed
    puts "You are currently going #{@speed} km/h"
  end

  def shut_off
    @speed = 0
    puts "We are parking"
  end

  def spray_paint(color)
    puts "We are changing your #{self.color} color to #{color}"
    self.color = color
  end

end

my_car = MyCar.new(2017, 'red', 'Tesla')
my_car.current_speed
my_car.speed_up(30)
my_car.current_speed
my_car.speed_up(10)
my_car.current_speed
my_car.break(20)
my_car.current_speed
my_car.shut_off
my_car.current_speed
my_car.spray_paint("blue")
puts ''
MyCar.gas_mileage(55, 100)
p my_car
