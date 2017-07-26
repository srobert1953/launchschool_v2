# get_middle_character.rb

def center_of(string)
  string_center = string.size / 2
  if string.size.odd?
    string.slice(string_center)
  else
    string.slice(string_center - 1, 2)
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
