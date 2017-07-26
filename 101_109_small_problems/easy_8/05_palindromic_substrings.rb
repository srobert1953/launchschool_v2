# palindromic_substrings.rb

def substrings_at_start(string)
  result = []
  string.chars.each_index do |idx|
    substring = ''
    (0..idx).each { |char| substring << string[char]}
    result << substring
  end
  result
end

def substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << substrings_at_start(string[index..-1])
  end
  result.flatten
end

def palindrome?(word)
  word == word.reverse
end

def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.reject! { |word| word.size <= 1 }
  result = []

  all_substrings.each do |word|
    result << word if palindrome?(word)
  end

  result
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
