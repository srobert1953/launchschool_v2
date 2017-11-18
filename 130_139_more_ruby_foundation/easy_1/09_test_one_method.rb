require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '09_one_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def one?(collection, &block)
      @my_object.one?(collection, &block)
    end
  end

  def test_one_value_even
    result = one?([1, 3, 5, 6]) { |value| value.even? }
    assert_equal(true, result)
  end

  def test_one_odd_value
    result1 = one?([1, 3, 5, 6]) { |value| value.odd? }
    result2 = one?([1, 4, 6, 8]) { |value| value.odd? }
    assert_equal(false, result1)
    assert_equal(true, result2)
  end

  def test_one_modulo
    result = one?([1, 3, 5, 7]) { |value| value % 5 == 0 }
    assert_equal(true, result)
  end

  def test_one_all_true
    result = one?([1, 2, 3, 4]) { |val| true }
    assert_equal(false, result)
  end

  def test_one_all_false
    result = one?([1, 2, 3, 4]) { |val| false }
    assert_equal(false, result)
  end

  def test_one_empty_collection
    result = one?([]) { |val| true }
    assert_equal(false, result)
  end

  def test_one_launch_school_solution
    result = one?([5, 6, 15]) { |value| value % 5 == 0 }
    assert_equal(false, result)
  end
end
