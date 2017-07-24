# ddaaiillyy_ddoouubbllee.rb

def crunch(string)
  crunched_string = ''
  string.chars.each do |char|
    crunched_string << char unless crunched_string[-1] == char
  end
  crunched_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
