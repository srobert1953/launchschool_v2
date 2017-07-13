# greeting_a_user.rb

puts "What is your name?"
name = gets.chomp

def bummer?(name)
  name.end_with? '!'
end

p name
if bummer? name
  name.chop!
  puts "Hello #{name}. Why are we screaming?".upcase
else
  puts "Hello #{name}!"
end
