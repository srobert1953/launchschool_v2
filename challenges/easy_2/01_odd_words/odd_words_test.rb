require 'minitest/autorun'

require_relative 'odd_words'

class TestOddWords < MiniTest::Test

  def test_3_word_sentece
    output = OddWords.new("hello from kansas.").transform
    assert_equal "hello morf kansas.", output
  end

  def test_without_dot
    output = OddWords.new("hello from kansas man").transform
    assert_equal "hello morf kansas nam", output
  end

  def test_space_before_dot
    output = OddWords.new("hello from kansas man  .").transform
    assert_equal "hello morf kansas nam.", output
  end
end
