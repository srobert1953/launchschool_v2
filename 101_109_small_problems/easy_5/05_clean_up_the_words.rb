# clean_up_the_words.rb

CHARACTERS = ('a'..'z')

def cleanup(string)
  result = string.chars.map! do |char|
    if CHARACTERS.include?(char.downcase)
      char
    else
      char = ' '
    end
  end
  result.join.squeeze(' ')
end

p cleanup("-9adfgg") == " adfgg"
p cleanup("---what's my +*& line?") == ' what s my line '
