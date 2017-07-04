# loop_select.rb

str = "abcdefghijklmnopqrstuvwxyz"
selected_chars = ''
counter = 0

loop do
  current_char = str[counter]

  if current_char == 'a'
    selected_chars << current_char
  end

  break if counter == str.length
  counter += 1
end

p selected_chars
