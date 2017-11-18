require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '02_zipper'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def zip(arr1, arr2)
      @my_object.zip(arr1, arr2)
    end
  end

  def zip_empty_arrays
    output = zip([],[])

    assert_equal([], result)
  end

  def zip_two_arrays
    output = zip([1, 2, 3], [4, 5, 6])

    assert_equal([[1, 4], [2, 5], [3, 6]], output)
  end
end
