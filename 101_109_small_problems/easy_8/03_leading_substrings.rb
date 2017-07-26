# leading_substrings.rb

def substrings_at_start(string)
  result = []
  string.chars.each_index do |idx|
    substring = ''
    (0..idx).each { |char| substring << string[char]}
    result << substring
  end
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Launch School Solution

def substring_at_string(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end

  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
