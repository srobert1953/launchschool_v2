require 'minitest/autorun'

require_relative '04_divisors'

class TestDivision < MiniTest::Test
  def setup
    @my_class = Division.new
  end

  def test_divisions
    result1 = @my_class.divisors(1)
    result2 = @my_class.divisors(7)
    result3 = @my_class.divisors(12)
    resutl4 = @my_class.divisors(98)
    result5 = @my_class.divisors(99400891)
    result6 = @my_class.divisors(36)

    assert_equal([1], result1)
    assert_equal([1, 7], result2)
    assert_equal([1, 2, 3, 4, 6, 12], result3)
    assert_equal([1, 2 ,7, 14, 49, 98], resutl4)
    assert_equal([1, 9967, 9973, 99400891], result5)
    assert_equal([1, 2, 3, 4, 6, 9, 12, 18, 36], result6)
  end

  def test_no_integer_given
    assert_raises(NoInteger) do
      @my_class.divisors('a')
    end
  end
end
