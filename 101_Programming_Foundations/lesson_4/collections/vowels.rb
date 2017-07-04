# vowels.rb

def select_vowels(str)
  vowels = "aeiouAEIOU"
  selected_vowels = ''
  counter = 0

  loop do
    break if counter >= str.length

    char = str[counter]
    selected_vowels << char if vowels.include? char

    counter += 1
  end

  selected_vowels
end

p select_vowels "My name is Robert"
p select_vowels "My dog is Rocky"

p select_vowels("Of my House").size
