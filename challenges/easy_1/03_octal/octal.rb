# octal.rb

class Octal
  BASE = 8

  def initialize(octal_string)
    @octals = if invalid_octal_string?(octal_string)
      [0]
    else
      octal_string.chars.reverse.map(&:to_i)
    end
  end

  def to_decimal
    @octals.each_with_index do |num, idx|
      @octals[idx] = num * (BASE ** idx)
    end
    @octals.inject(&:+)
  end

  private

  def invalid_octal_string?(octal_string)
    octal_string =~ /\D|[8-9]/
  end
end
