# select_letter.rb

def select_letter(string, letter)
  selected_letters = ''
  counter = 0

  loop do
    break if counter >= string.length

    current_letter = string[counter]
    if current_letter == letter
      selected_letters << current_letter
    end

    counter += 1
  end

  selected_letters
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter question, 's'
p select_letter question, 'a'
