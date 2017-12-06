# crypto.rb
class Crypto

  def initialize(message)
    @normalize_message = message.downcase.scan(/\w/)
  end

  def normalize_plaintext
    @normalize_message.join('')
  end

  def size
    text_size = normalize_plaintext.size

    if perfect_square?(text_size)
      Math.sqrt(text_size)
    else
      Math.sqrt(text_size).to_i + 1
    end
  end

  def plaintext_segments
    split_size = size
    result = []
    counter = 0

    while counter < @normalize_message.size
      result << @normalize_message[counter, split_size].join('')
      counter += split_size
    end

    result
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

  private

  def perfect_square?(length)
    Math.sqrt(length) % Math.sqrt(length).to_i == 0
  end
end
