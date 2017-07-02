# question_06.rb

# Starting with the string:

famous_words = "seven years ago..."
# show two different ways to put the expected "Four score and " in front of it.
expected_words = "Four score and "

famous_words.prepend expected_words
p famous_words

famous_words = "seven years ago..."
famous_words.insert(0, expected_words)
p famous_words
