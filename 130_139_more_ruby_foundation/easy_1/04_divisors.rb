class NoInteger < StandardError; end

class Division
  def divisors(number)
    raise NoInteger, "Integer not given" unless number.is_a? Integer

    result = []
    sqrt_number = Math.sqrt(number)
    1.upto(sqrt_number) do |divisor|
      if number % divisor == 0
        result << divisor
        result << number / divisor unless divisor == sqrt_number
      end
    end

    result.sort
  end
end

