require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_incuded_in_array
    array = ['abc', 'xyz']
    assert_includes array, 'xyz'
  end
end
