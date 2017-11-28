# scrabble.rb
class Scrabble
  SCORE_TABLE = {
    %w(a e i o u l n r s t) => 1,
    %w(d g)                 => 2,
    %w(b c m p)             => 3,
    %w(f h v w y)           => 4,
    %w(k)                   => 5,
    %w(j x)                 => 8,
    %w(q z)                 => 10
  }

  def self.score(word)
    new(word).score
  end

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless @word.is_a? String

    result = [0]
    @word.downcase.chars.each do |char|
      if char =~ /[a-z]/
        score = SCORE_TABLE.select do |score_letters|
          score_letters.include? char
        end
        result.concat score.values
      end
    end

    result.reduce(&:+)
  end
end

