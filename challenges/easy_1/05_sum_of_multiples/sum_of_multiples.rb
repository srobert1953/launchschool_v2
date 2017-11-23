# sum_of_multiples.rb
class SumOfMultiples
  def self.to(limit)
    new(3, 5).to(limit)
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(limit)
    (0...limit).select do |number|
      @multiples.any? { |list_number| (number % list_number).zero? }
    end.reduce(&:+)
  end
end
