# exercises_2.rb

module Storagable
  def storage
    "I have a lot of storage"
  end
end

class Vehicle
  attr_accessor :model, :color
  attr_reader :year

  @@created_cars = 0

  def initialize(y, c, m)
    @@created_cars += 1
    self.model = m
    self.color = c
    @year = y
    @speed = 0
  end

  def self.runing_cars
    puts "There are #{@@created_cars} running cars."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
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

  def age
    "Your car is #{calculate_age} years old"
  end

  private

  def calculate_age
    Time.new.year - self.year
  end
end

class MyCar < Vehicle
  include Storagable

  SEATS = 5

  def initialize(y, c, m)
    super
  end

  def spray_paint(color)
    puts "We are changing your #{self.color} color to #{color}"
    self.color = color
  end
end

class MyTruck < Vehicle
  SEATS = 3
end

puts "--- MyTruck ancestors ---"
p MyTruck.ancestors
puts "--- MyCar ancestors ---"
p MyCar.ancestors

my_car = MyCar.new(2016, 'red', 'Tesla')
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

p my_car.color
p my_car.age
