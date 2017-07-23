# short_long_short.rb

# determine shorter string
# concatenate the longer string to shorter string
# and then add the shorter string again

def short_long_short(str1, str2)
  if str1.length < str2.length
    str1 + str2 + str1
  else
    str2 + str1 + str2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
