# anagram.rb
class Anagram
  def initialize(anagram)
    @anagram = anagram
  end

  def match(words_array)
    words_array.select do |word|
      sort_word(word) == sort_word(@anagram) &&
        !word.casecmp?(@anagram)
    end
  end

  private

  def sort_word(word)
    word.downcase.chars.sort
  end
end
