require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '01_from_to_step'

class TestMyClass < MiniTest::Test
  def setup
    @my_object = MyClass.new

    def step(from, to, step, &block)
      @my_object.step(from, to, step, &block)
    end
  end

  def test_step_block_prints
    result = capture_io do
      step(1, 10, 2) { |idx| puts "value = #{idx}"}
    end.first

    output = "value = 1\nvalue = 3\nvalue = 5\nvalue = 7\nvalue = 9\n"

    assert_equal(output, result)
  end

  def test_step_all_steps
    result = []
    step(1, 20, 4) { |idx| result << idx }

    assert_equal([1, 5, 9, 13, 17], result)
  end

end
