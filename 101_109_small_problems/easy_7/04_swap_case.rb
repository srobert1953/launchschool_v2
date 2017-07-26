# swap_case.rb

def swapcase(string)
  characters = string.chars
  characters.map! do |char|
    if ('a'..'z').include? char
      char.upcase
    elsif ('A'..'Z').include? char
      char.downcase
    else
      char
    end
  end

  characters.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

