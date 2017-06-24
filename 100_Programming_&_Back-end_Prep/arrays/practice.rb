# practice.rb

# 1. Use:
# .clear
# .join
# .join ","
# .length
# .first
# .last
# .shift
# .unshift
# .pop
# .push
# .delete 'object'
# .delete_at 0
# .uniq
# .include?
# .flatten
# .product
# ===
# .map/.collect
# .sort
# .find/.detect
# .find_all/.select
# .any?/.all?
# .delete_if {}

# 1. Write a method which returns an array of series of words collected from a user. User can enter only word at a time which doesn't contain spaces. Store the collected words in an array. The user can stop entering the words by typing “exit”.

def collect_words

  def one_word? word
    word_arr = word.split("")
    word_arr.any? { |letter| letter == " " }
  end

  words = []
  puts "Enter word which will be stored in an array:"
  word = gets.chomp

  while word != "exit"
    if one_word? word
      puts "Please enter only one word:"
      word = gets.chomp
    else
      words.push word
      puts "Your word #{word.capitalize} was inserted to an array."
      puts "Enter another word, or stop by 'exit'"
      word = gets.chomp
    end
  end
  words
end

words = collect_words
puts ""
# 2. Write a program that sorts the collected words from a user in assignment 1. either descending or ascending based on user preference.

def user_sort array
  puts "What order to sort? 'desc' or 'asc'?"
  answer = gets.chomp.downcase

  case answer
  when 'asc'
    array.sort
  when 'desc'
    array.sort { |val1, val2| val2 <=> val1 }
  else
    puts "Please type 'desc' for descending order, or 'asc' for ascending order."
    user_sort array
  end
end

puts "Ascending: #{user_sort words}"
puts "Descending: #{user_sort words}"










