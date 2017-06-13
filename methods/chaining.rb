# chaining.rb

def add_three number
  number + 3
end

p add_three(4).times { puts "this should print 7 times" }.times { puts "Another 7 times"}

def add_four number
  puts number + 4
end

p add_four 5

p "Hi there".length.to_s

# add_four(3).times { puts "Will this work?"} # doesn't work. method add_four returns nil.

def add_four number
  new_value = number + 4
  puts new_value
  new_value
end

add_four(7).times { puts "This now works" }
