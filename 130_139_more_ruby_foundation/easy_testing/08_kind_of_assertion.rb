require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_kinf_of_numeric
    assert_kind_of Numeric, 2
  end
end
