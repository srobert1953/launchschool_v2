# run_length_encoding.rb
class RunLengthEncoding
  def self.encode(string)
    result = ''
    current_char = string[0]
    counter = 0
    string.chars.each_with_index do |char, idx|
      if char == current_char
        counter += 1
      else
        result << encoded_character(counter, current_char)
        current_char = char
        counter = 1
      end
      if idx == string.size - 1
        result << encoded_character(counter, current_char)
      end
    end
    result
  end

  def self.encoded_character(number, char)
    number == 1 ? char.to_s : number.to_s + char
  end

  def self.decode(string)
    deocde_array = string.scan(/[0-9]+|./)
    result = ''
    current_number = 0
    deocde_array.each do |value|
      if value.to_i <= 0
        result << (current_number.zero? ? value : value * current_number)
        current_number = 0
      else
        current_number = value.to_i
      end
    end
    result
  end
end
