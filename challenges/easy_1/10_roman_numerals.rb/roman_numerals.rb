# roman_numerals.rb
class Integer
  ROMAN_NUMBERS = { 1000 => 'M',
                    900  => 'CM',
                    500  => 'D',
                    400  => 'CD',
                    100  => 'C',
                    90   => 'XC',
                    50   => 'L',
                    40   => 'XL',
                    10   => 'X',
                    9    => 'IX',
                    5    => 'V',
                    4    => 'IV',
                    1    => 'I' }.freeze

  def to_roman
    number = self
    roman_number = ""

    ROMAN_NUMBERS.each do |value, roman_symbol|
      current_number = number / value
      roman_number << roman_symbol * current_number
      number = number % value
    end

    roman_number
  end
end

# compute all combinations from basic I, V, X, L, C, D, M
# def to_roman
#   number_size = to_s.size - 1

#   result = []

#   number_size.downto(0) do |nth|
#     base = 10**nth
#     base_plus_one = 10**(nth + 1)
#     remainder = base_plus_one - self % base_plus_one
#     half = 5 * base
#     left_right = (half - remainder) / base
#     adjustment = left_right.abs

#     if left_right < 0 && adjustment >= 2
#       result.push ROMAN_NUMBERS[base] * (half / base - adjustment)

#     elsif left_right < 0 && adjustment < 2
#       result.push ROMAN_NUMBERS[base] * adjustment
#       result.push ROMAN_NUMBERS[half]

#     elsif left_right > 0 && adjustment <= 3
#       result.push ROMAN_NUMBERS[half]
#       result.push ROMAN_NUMBERS[base] * adjustment

#     elsif left_right > 0 && adjustment > 3
#       result.push ROMAN_NUMBERS[base] * (half / base - adjustment)
#       result.push ROMAN_NUMBERS[base_plus_one]

#     elsif left_right.zero?
#       result.push ROMAN_NUMBERS[half]

#     else
#       result.push ROMAN_NUMBERS[base]
#     end
#   end
#   result.join
# end
