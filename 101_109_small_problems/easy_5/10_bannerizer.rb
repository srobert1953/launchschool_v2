# bannerizer.rb

def print_in_box(string)
  char_length = string.size
  puts "+-" + "-" * char_length + "-+"
  puts "| " + " " * char_length + " |"
  puts "| " + string + " |"
  puts "| " + " " * char_length + " |"
  puts "+-" + "-" * char_length + "-+"
end

print_in_box("")
print_in_box('To boldly go where no one has gone before.')
