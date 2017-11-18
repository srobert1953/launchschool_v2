require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '03_map_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def map(arr, &block)
      @my_object.map(arr, &block)
    end
  end

  def test_map_multiplied_number
    output = map([1, 3, 6]) { |num| num **2 }

    assert_equal([1, 9, 36], output)
  end

  def test_map_empty_array
    output = map([]) { |num| true }

    assert_equal([], output)
  end

  def test_map_all_true_values
    output = map([1, 2, 3, 4]) { |num| true }

    assert_equal([true, true, true, true], output)
  end

  def test_map_upcase_all
    output = map(['a', 'b', 'c', 'd']) { |val| val.upcase }

    assert_equal(['A', 'B', 'C', 'D'], output)
  end

  def test_map_values_are_arrays
    output = map([1, 3, 4]) { |val| (1..val).to_a }

    assert_equal([[1], [1, 2, 3], [1, 2, 3, 4]], output)
  end
end
