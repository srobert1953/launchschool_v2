# palindrome_strings_2.rb

def palindrome?(str)
  str == str.reverse
end

def real_palindrome?(val)
  alphanum_values = ('a'..'z').to_a + ('0'..'9').to_a
  alphanum = val.downcase.chars.select do |ch|
    alphanum_values.include? ch
  end
  palindrome?(alphanum)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
