class Atbash
  CONVERSION_TABLE = {
    'a' => 'z',
    'b' => 'y',
    'c' => 'x',
    'd' => 'w',
    'e' => 'v',
    'f' => 'u',
    'g' => 't',
    'h' => 's',
    'i' => 'r',
    'j' => 'q',
    'k' => 'p',
    'l' => 'o',
    'm' => 'n'
  }

  def self.encode(string)
    result = []
    string.scan(/[a-z0-9]/i).each { |char| result << decode(char.downcase) }
    group(result).rstrip
  end

  def self.decode(char)
    if char =~ /[a-m]/
      CONVERSION_TABLE[char]
    elsif char =~ /[n-z]/
      CONVERSION_TABLE.select { |_, v| v == char }.first.first
    else
      char
    end
  end

  def self.group(array)
    result = ''
    counter = 1
    array.each do |char|
      result << char
      result << ' ' if (counter % 5).zero?
      counter += 1
    end
    result
  end
end
