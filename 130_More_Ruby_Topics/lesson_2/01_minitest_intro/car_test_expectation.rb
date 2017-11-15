require 'minitest/autorun'

require_relative 'car'

describe "Car#wheels" do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4
  end
end
