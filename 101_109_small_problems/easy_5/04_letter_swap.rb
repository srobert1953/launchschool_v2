# letter_swap.rb

def swap(string)
  str_array = string.split.map do |word|
    first_letter = word[0]
    last_letter = word[-1]
    word[0] = last_letter
    word[-1] = first_letter
    word
  end
  str_array.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# Launch School Solution

def swap_letter(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  result = string.split.map do |word|
    swap_letter word
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
