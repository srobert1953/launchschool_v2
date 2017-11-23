class Trinary
  BASE = 3

  def initialize(trinary_string)
    @trinary = trinary?(trinary_string) ? trinary_string : '0'
  end

  def to_decimal
    decimal = 0
    @trinary.reverse
            .each_char
            .with_index { |num, idx| decimal += num.to_i * BASE ** idx }
    decimal
  end

  def trinary?(string)
    !(string =~ /(\D|[3-9])/)
  end
end
