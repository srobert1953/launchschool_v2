# crypto.rb
class Crypto

  def initialize(message)
    @normalize_message = message.downcase.scan(/\w/)
  end

  def normalize_plaintext
    @normalize_message.join('')
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    result = ''

    size.times do |idx|
      plaintext_segments.each { |word| result << word[idx] unless word[idx].nil? }
    end

    result
  end

  def normalize_ciphertext
    result = []

    size.times do |idx|
      ciper_word = ''
      plaintext_segments.each do |word|
        ciper_word << word[idx] unless word[idx].nil?
      end
      result << ciper_word
    end

    result.join(' ')
  end
end
