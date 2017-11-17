# => brute-forced methods:
# => - deciphers_rot13
# => - rot13
# => needs refactoring

class Decipher
  def deciphers_list(list)
    result = []
    list.each do |name|
      result << deciphers_rot13(name)
    end
    result
  end

  def deciphers_rot13(item)
    result = item.chars.map do |char|
      case char
      when ' ' then ' '
      when '-' then '-'
      else
        rot13(char)
      end
    end
    result.join('')
  end

  def rot13(char)
    input_char = %W(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)
    output_char = %W(N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m)

    idx = input_char.find_index(char)
    output_char[idx]
  end
end

