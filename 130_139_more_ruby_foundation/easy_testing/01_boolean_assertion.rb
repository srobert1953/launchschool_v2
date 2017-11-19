require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_odd_values
    value = 2
    result = value.odd?
    assert result, "Value is not odd"
  end
end
