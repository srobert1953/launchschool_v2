# word_to_digit.rb

NUMBERS = {
  'one'   => 1,
  'two'   => 2,
  'three' => 3,
  'four'  => 4,
  'five'  => 5,
  'six'   => 6,
  'seven' => 7,
  'eight' => 8,
  'nine'  => 9,
  'zero'  => 0
}

def chars_split(word)
  word, special_char = word.chars.partition { |ch| ch =~ /[a-zA-Z0-9]/ }
  [word.join, special_char]
end

def phone_number(number)
  array_number = number.split('')
  array_number.insert(0, '(')
  array_number.insert(4, ')')
  array_number.insert(5, ' ')
  array_number.insert(-5, '-')
  array_number.join
end

def number?(number)
  number == number.to_i.to_s
end

def join_numbers(sentence)
  sentence = sentence.gsub(/[0-9] /) { |n| n.rstrip }
  sentence = sentence.split.map do |word|
    string_number, separator = chars_split(word)
    if number?(string_number) && string_number.size == 10
      string_number = phone_number(string_number)
    else
      string_number
    end
    [string_number, separator].flatten.join
  end
  sentence.join(' ')
end

def word_to_digit(sentence)
  words = sentence.split
  words.map! do |word|
    word, special_char = chars_split(word)
    number_word = NUMBERS.member?(word.downcase) ? NUMBERS[word.downcase] : word
    [number_word, special_char].flatten.join
  end
  join_numbers(words.join(' '))
end

p word_to_digit('Please call me at Five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit("One two three four five six seven eight nine zero.")

p word_to_digit('Please call me at One two three four five six seven eight nine zero. Thanks!')

# p phone_number('1234567890')
