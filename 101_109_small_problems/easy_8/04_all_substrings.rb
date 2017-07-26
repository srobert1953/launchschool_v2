# all_substrings.rb

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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
