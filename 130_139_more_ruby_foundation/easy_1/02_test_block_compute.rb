require 'minitest/autorun'

require_relative '02_optional_block'

class TestComputeBlock < MiniTest::Test
  def setup
    @my_class = ComputeBlock.new
  end

  def test_block_given
    value1 = @my_class.compute { 3 + 5}
    value2 = @my_class.compute { 'a' + 'b' }

    assert_equal(8, value1)
    assert_equal('ab', value2)
  end

  def test_block_not_given
    value = @my_class.compute
    assert_equal('Does not compute', value)
  end

  def test_block_returns_argument
    value1 = @my_class.compute(5) { |num| num }
    value2 = @my_class.compute(5) { |num| num + 3 }

    assert_equal(5, value1)
    assert_equal(8, value2)
  end
end
