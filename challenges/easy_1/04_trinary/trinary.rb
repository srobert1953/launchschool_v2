class Trinary
  BASE = 3

  def initialize(trinary_string)
    @trinary = trinary?(trinary_string) ? trinary_string : '0'
  end

  def to_decimal
    @trinary.reverse
            .each_char
            .with_index
            .reduce(0) { |sum, (num, idx)| sum += num.to_i * BASE ** idx }
  end

  def trinary?(string)
    !(string =~ /(\D|[3-9])/)
  end
end
