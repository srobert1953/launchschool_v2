require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_nil
    value = nil
    assert_nil value, "The value is not nil"
  end
end
