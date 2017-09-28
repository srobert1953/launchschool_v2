module Movable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Movable

  def initialize(tire_array, km_travel_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_travel_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_presure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    super([30, 30, 32, 32], 2, 5)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    super([20, 20], 80, 8.0)
  end
end

class Seacraft
  include Movable

  attr_accessor :propeller_count, :hull_count

  def initialize(num_propellers, num_huls, km_travel_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_travel_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    self.propeller_count = num_propellers
    self.hull_count = num_huls
  end

  def range
    super + 10
  end
end

class Catamaran < Seacraft

end

class Motorboat < Catamaran
  def initialize(num_propellers, num_huls, km_travel_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_travel_per_liter, liters_of_fuel_capacity)
  end
end

catamaran = Catamaran.new(3, 2, 2, 5)
auto = Auto.new

p catamaran.range
p auto.range
