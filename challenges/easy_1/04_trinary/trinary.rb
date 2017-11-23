# trinary.rb
class Trinary
  BASE = 3

  def initialize(string)
    @trinary = string =~ /(\D|[3-9])/ ? '0' : string
  end

  def to_decimal
    @trinary.reverse
            .each_char
            .with_index
            .reduce(0) { |sum, (num, idx)| sum + (num.to_i * BASE**idx) }
  end
end
