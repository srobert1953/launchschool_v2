require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '04_count_method'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def count(*collection, &block)
      @my_object.count(*collection, &block)
    end
  end

  def test_count_odd_items
    result = count(1, 2, 3, 4, 5) { |num| num.odd? }

    assert_equal(3, result)
  end

  def test_count_empty_arguments
    result = count() { |num| true }

    assert_equal(0, result)
  end

  def test_count_all_true
    result = count(1, 2, 3) { |num| true }

    assert_equal(3, result)
  end
end
