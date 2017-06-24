def string_lengths(sentence)
  string = sentence.split
  lengths = []
  counter = 1

  until counter == string.size do
    word_length = string[counter - 1].length
    lengths.push word_length
    counter += 1
  end
  lengths
end

p string_lengths("Be or not to be")
