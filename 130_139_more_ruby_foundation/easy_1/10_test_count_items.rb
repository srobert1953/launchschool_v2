require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '10_count_items'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new
    def count(collection, &block)
      @my_object.count(collection, &block)
    end

    @collection = [1, 2, 3, 4, 5, 6]
  end

  def test_counting
    result1 = count(@collection) { |val| val.odd? }
    assert_equal(3, result1)

    result2 = count(@collection) { |val| val % 3 == 0 }
    assert_equal(2, result2)

    result3 = count(@collection) { |val| true }
    assert_equal(6, result3)

    result4 = count(@collection) { |val| false }
    assert_equal(0, result4)

    result5 = count([]) { |val| true }
    assert_equal(0, result5)

    result6 = count(%w(Four score and seven)) { |val| val.size == 5 }
    assert_equal(2, result6)
  end

end
