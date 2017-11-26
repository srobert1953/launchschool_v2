# perfect_numbers.rb
class PerfectNumber
  def self.classify(number)
    raise RuntimeError, 'Incorrect number entered' if number <= 0

    factors_sum = (1..number/2).select { |num| (number % num).zero? }
                               .inject(&:+)
    if factors_sum == number
      'perfect'
    elsif factors_sum < number
      'deficient'
    else
      'abundant'
    end
  end
end
