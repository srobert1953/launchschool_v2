require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class TestEmployee < MiniTest::Test
  def setup
    @emplyee = Employee.new
  end

  def test_experience_exception
    assert_raises(NoExperienceError) do
      @emplyee.hire
    end
  end
end
