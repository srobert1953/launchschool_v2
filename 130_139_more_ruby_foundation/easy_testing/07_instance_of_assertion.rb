require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_instance_of_numeric
    assert_instance_of(Numeric, 1)
  end
end
