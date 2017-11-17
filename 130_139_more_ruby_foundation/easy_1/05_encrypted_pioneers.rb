class Decipher
  def deciphers_list(list)
    result = []
    list.each do |name|
      result << deciphers_string(name)
    end
    result
  end

  def deciphers_string(string)
    string.chars.reduce('') do |result, char|
      result + rot13(char)
    end
  end

  def rot13(char)
    case char
    when 'A'..'M', 'a'..'m' then (char.ord + 13).chr
    when 'N'..'Z', 'n'..'z' then (char.ord - 13).chr
    else char
    end
  end
end

