# longest_sentence.rb

file = File.read('text.txt')

# => Read text from a file and assign it to a variable
# => Crete an array from file with space as a separator
# => Create a place holder for word count
# => Create a place holder for max words
# => Iterate over the array collection
# => With each iteration:
# =>  add one to place holder for each word
# =>  check if word includes one of the sentence ending characters (. ! ?)
# =>    If there is a match compare word count and max words
# =>    If word count is higher assign max words to word count
# =>    Else leave max words as is
# =>    Reset word count to zero
# => When iteration ends, return the max words

# SET words_array
# SET word_count
# SET max_words
# START loop on words_array
#   word_count + 1
#   current_word contain (. ! ?)
#   IF yes
#     word_count > max_words
#       IF yes
#         max_words = word_count
#     word_count = 0
# END loop

# def sentence_end?(word)
#   word.chars.select { |char| %w(. ! ?).include? char }.count > 0
# end

# words_array = file.split
# words_count = 0
# words_max = 0
# words_array.each do |current_word|
#   words_count += 1
#   if sentence_end?(current_word)
#     words_max = words_count if words_count > words_max
#     words_count = 0
#   end
# end

# puts "The longest sentence has #{words_max} words."

# PRINT the longest sentence

# => split the sentence based on (. ! ?)
# => check the size of words on each index in array
# => save the result into hash as number => size of words
# => get the highest size of words from the hash as arryay
# => print the sentence from the array of sentences with array[0] as index

array_sentences = file.split(/[.!?]/)
word_counts = {}
array_sentences.each_with_index do |sentence, idx|
  word_counts[idx] = sentence.split.size
end

sentence_idx, words_count = word_counts.max_by { |_, value| value }

puts array_sentences[sentence_idx]
puts "The longest sentence has #{words_count} words"
