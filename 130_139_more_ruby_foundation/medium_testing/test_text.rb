require 'minitest/autorun'

require_relative 'text'

class TestText < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text_file = @file.read

    @text_object = Text.new(@text_file)
  end

  def test_swap
    a_times = @text_file.count('a')
    e_times = @text_file.count('e')

    new_text = @text_object.swap('a', 'e')

    assert_equal e_times + a_times, new_text.count('e')
  end

  def test_word_count
    assert_equal 72, @text_object.word_count
  end

  def teardown
    @file.close
  end
end
