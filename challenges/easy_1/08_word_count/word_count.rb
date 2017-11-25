# word_count.rb
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    result = Hash.new(0)
    @phrase.scan(/\b[\w']+\b/) do |word|
      result[word.downcase] += 1
    end
    result
  end
end

