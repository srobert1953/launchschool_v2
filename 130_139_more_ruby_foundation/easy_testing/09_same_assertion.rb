require 'minitest/autorun'

class List
  def process
    self
  end
end

class TestClass < MiniTest::Test
  def setup
    @list = List.new
  end

  def test_same_objects
    assert_same @list, @list.process
  end
end
