require 'minitest/autorun'

require_relative '06_any_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_class = MyClass.new
  end

  def test_any_even_numbers
    numbers = [1, 3, 5, 6]
    result = @my_class.any?(numbers) { |num| num.even? }
    assert_equal(true, result)
  end

  def test_any_odd_numbers
    numbers1 = [1, 3, 5, 7]
    result1 = @my_class.any?(numbers1) { |num| num.odd? }
    assert_equal(true, result1)

    numbers2 = [2, 4, 6, 8]
    result2 = @my_class.any?(numbers2) { |num| num.odd? }
    assert_equal(false, result2)
  end

  def test_any_reminder_is_zero
    numbers = [1, 3, 5, 7]
    result = @my_class.any?(numbers) { |num| num % 5 ==  0 }
    assert_equal(true, result)
  end

  def test_any_true_value
    numbers = [1, 3, 5, 7]
    result = @my_class.any?(numbers) { |num| true }
    assert_equal(true, result)
  end

  def test_any_false_value
    numbers = [1, 2, 3, 4]
    result = @my_class.any?(numbers) { |num| false }
    assert_equal(false, result)
  end

  def test_any_empty_array
    arr = []
    result = @my_class.any?(arr) { |num| true }
    assert_equal(false, result)
  end

  def test_any_with_hash
    hash = { name: 'Robert', age: 31}
    result = @my_class.any?(hash) { |key, value| value == 31 }
    assert_equal(true, result)
  end
end
