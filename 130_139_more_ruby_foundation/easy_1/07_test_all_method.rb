require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '07_all_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new
  end

  def test_all_odd_values
    numbers = [1, 3, 5, 6]
    result = @my_object.all?(numbers) { |num| num.odd? }
    assert_equal(false, result)

    numbers2 = [1, 3, 5, 7]
    result2 = @my_object.all?(numbers2) { |num| num.odd? }
    assert_equal(true, result2)
  end

  def test_all_even_numbers
    numbers = [2, 4, 6, 8]
    result = @my_object.all?(numbers) { |num| num.even? }
    assert_equal(true, result)
  end

  def test_all_reminders_zero
    numbers = [1, 3, 5, 7]
    result = @my_object.all?(numbers) { |num| num % 5 == 0 }
    assert_equal(false, result)
  end

  def test_all_values_true
    numbers = [1, 2, 3, 4]
    result = @my_object.all?(numbers) { |num| true }
    assert_equal(true, result)
  end

  def test_all_values_false
    numbers = [1, 2, 3, 4]
    result = @my_object.all?(numbers) { |num| false }
    assert_equal(false, result)
  end

  def test_empty_collection
    collection = []
    result1 = @my_object.all?(collection) { |num| false }
    result2 = @my_object.all?(collection) { |num| false }
    assert_equal(true, result1)
    assert_equal(true, result2)
  end
end
