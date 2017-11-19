require 'minitest/autorun'

class TestClass < MiniTest::Test
  def test_include_refutation
    arr = ['abc', 'xyz']

    refute_includes arr, 'xyz'
  end
end
