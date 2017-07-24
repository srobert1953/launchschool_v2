# letter_counter_2.rb

CHARACTERS = ('a'..'z')

def remove_special_characters(word)
  result = word.chars.select do |char|
    CHARACTERS.include? char.downcase
  end
  result.join
end

def word_sizes(string)
  result = Hash.new(0)
  string.split.each do |word|
    word_size = remove_special_characters(word)
    result[word_size.size] += 1
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
