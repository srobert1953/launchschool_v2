require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_empty_array
    array = []
    assert_predicate array, :empty?
  end
end
