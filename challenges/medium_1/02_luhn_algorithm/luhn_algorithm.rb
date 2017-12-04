# luhn_algorithm.rb
class Luhn
  def initialize(number)
    @number = number.to_s.chars.map(&:to_i)
  end

  def self.create(number)
    luhn_number = new(number)

    luhn_number.valid? ? number : calculate_luhn_number(number)
  end

  def self.calculate_luhn_number(number)
    10.times do |last_digit|
      valid_number = number.to_s + last_digit.to_s
      valid_number = valid_number.to_i
      return valid_number if new(valid_number).valid?
    end
    nil
  end

  def addends
    luhn_number = @number.reverse.map.with_index do |number, idx|
      idx.odd? ? double_number(number) : number
    end
    luhn_number.reverse!
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  private

  def double_number(number)
    doubled = number * 2
    doubled >= 10 ? doubled - 9 : doubled
  end
end
