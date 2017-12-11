# pig_latin.rb
class PigLatin
  def self.translate(words)
    words = words.split
    words.map! { |word| pig_word(word) }
    words.join(' ')
  end

  def self.pig_word(word)
    vowels = word.scan(/\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/).join
    middle = word.sub(vowels, '')
    middle + vowels + 'ay'
  end
end
