# num_of_chars.rb

def characters(str)
  str.split.join.length
end

puts ">> Please type word or multiple words:"
string = gets.chomp

puts "There are #{characters(string)} characters in: #{string.inspect}"
