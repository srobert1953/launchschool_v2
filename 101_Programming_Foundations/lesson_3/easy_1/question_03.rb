# question_03.rb

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

puts "First solution"

advice_arr = advice.split
idx = advice_arr.find_index "important"
advice_arr[idx] = "urgent"
advice = advice_arr.join(' ')

p advice

puts "Second Solution"

advice.gsub!("important", "urgent")
p advice
