require 'minitest/autorun'

require_relative 'luhn_algorithm'

class LuhnTest < MiniTest::Test

  def test_addends_number_3442
    adden_num = Luhn.new(3442)
    assert_equal [6, 4, 8, 2], adden_num.addends
  end

  def test_addends_number_9745
    adden_num = Luhn.new(9745)
    assert_equal [9, 7, 8, 5], adden_num.addends
  end

  def test_addends
    luhn = Luhn.new(12_121)
    assert_equal [1, 4, 1, 4, 1], luhn.addends
  end

  def test_checksum
    luhn = Luhn.new(4913)
    assert_equal 22, luhn.checksum
  end

  def test_checksum_again
    luhn = Luhn.new(201_773)
    assert_equal 21, luhn.checksum
  end

  def test_invalid_number
    luhn = Luhn.new(738)
    refute luhn.valid?
  end

  def test_valid_number
    luhn = Luhn.new(8_739_567)
    assert luhn.valid?
  end

  def test_create_valid_number
    number = Luhn.create(123)
    assert_equal 1230, number
  end

  def test_create_other_valid_number
    number = Luhn.create(873_956)
    assert_equal 8_739_567, number
  end

  def test_create_yet_another_valid_number
    number = Luhn.create(837_263_756)
    assert_equal 8_372_637_564, number
  end

  def test_do_not_create_a_new_number
    number = Luhn.create(8_739_567)
    assert_equal 8_739_567, number
  end
end
