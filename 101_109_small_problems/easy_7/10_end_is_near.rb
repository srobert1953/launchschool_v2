# end_is_near.rb

def penultimate(words)
  words.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

def middle_word(words)
  return "There is no middle word" if words.split.size.even?
  words_array = words.split
  middle_index = words_array.size / 2
  words_array[middle_index]
end

p middle_word('last word') == 'There is no middle word'
p middle_word('Launch School is great, right?') == 'is'
p middle_word('') == 'There is no middle word'
