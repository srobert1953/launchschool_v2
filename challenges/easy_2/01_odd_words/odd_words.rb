# odd_words.rb
class OddWords
  def initialize(sentence)
    @sentence = sentence
  end

  def transform
    result = @sentence.scan(/\b[\w']+\b|.$/).map.with_index do |word, idx|
      idx.odd? ? word.reverse : word
    end

    if result.last == '.'
      dot = result.pop
      result[-1] += dot
    end
    result.join(' ')
  end
end



