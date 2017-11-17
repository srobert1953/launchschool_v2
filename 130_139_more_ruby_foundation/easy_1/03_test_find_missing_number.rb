require 'minitest/autorun'

require_relative '03_find_missing_numbers'

class TestMissingNumber < MiniTest::Test
  def setup
    @my_class = MissingNumber.new
  end

  def test_missing_numbers
    given_array = [-3, -2, 1, 5]

    assert_equal([-1, 0, 2, 3, 4], @my_class.missing(given_array))
  end

  def test_no_missing_numbers
    given_array = [1, 2, 3, 4, 5]

    assert_equal([], @my_class.missing(given_array))
  end

  def test_one_object_in_given_array
    given_array = [5]

    assert_equal([], @my_class.missing(given_array))
  end

  def test_empt_array_given
    given_array = []

    assert_raises(RangeError) do
      @my_class.missing(given_array)
    end
  end
end
