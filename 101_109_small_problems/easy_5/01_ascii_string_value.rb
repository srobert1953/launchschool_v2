# ascii_string_value.rb

def ascii_value(string)
  value = 0
  counter = 0
  loop do
    break if string.length == 0
    value += string[counter].ord
    counter += 1
    break if string.length == counter
  end
  value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


# => launch School Solution

def ascii_value(string)
  value = 0
  string.each_byte { |char| value += char }
  value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# => Additional solution

def ascii_value(string)
  return 0 if string.empty?
  string.bytes.inject(:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
