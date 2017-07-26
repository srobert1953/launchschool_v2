# double_chart_2.rb

def double_consonants(string)
  result = []
  string.each_char do |char|
    double_char = char * 2
    if (char =~ /[a-z]/i && !%(a e i o u).include?(char.downcase))
      result << double_char
    else
      result << char
    end
  end
  result.join('')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Launch School Solution

CONSONANTS = %w(a b c d f g h j k l m n p g r s t v w x y z)

def double_consonants(string)
  result = []

  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end

  result.join('')
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
