# sieve.rb

class Sieve
  def initialize(limit)
    @numbers = (2..limit).to_a
  end

  def primes
    prime_numbers = []
    until @numbers.empty?
      prime_numbers << @numbers.shift
      @numbers.reject! { |number| number % prime_numbers.last == 0 }
    end
    prime_numbers
  end
end
