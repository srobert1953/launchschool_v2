require 'minitest/autorun'

require_relative 'car'

class TestCar < MiniTest::Test

  def setup
    @car1 = Car.new
    @car2 = Car.new

    @car1.name = 'Robert'
    @car2.name = 'Robert'
  end

  def test_equality
    assert_equal(@car1, @car2)
    assert_same(@car1, @car2)
  end
end
