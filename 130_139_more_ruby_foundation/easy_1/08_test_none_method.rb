require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '08_none_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def none?(collection, &block)
      @my_object.none?(collection, &block)
    end
  end

  def test_none_even_values
    result1 = none?([2, 4, 6, 7]) { |value| value.odd? }
    result2 = none?([2, 4, 6, 8]) { |value| value.odd? }
    assert_equal(false, result1)
    assert_equal(true, result2)
  end

  def test_none_odd_values
    result = none?([2, 4, 6, 8]) { |value| value.even? }
    assert_equal(false, result)
  end

  def test_all_values_true
    result = none?([1, 3, 5, 7]) { |value| true }
    assert_equal(false, result)
  end

  def test_all_values_false
    result = none?([1, 3, 5, 7]) { |val| false }
    assert_equal(true, result)
  end
end
