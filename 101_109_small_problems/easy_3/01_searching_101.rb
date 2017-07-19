# searching_101.rb

def ordinal(num)
  if [11, 12, 13].include? num
    "#{num}th"
  elsif num % 10 == 3
    "#{num}rd"
  elsif num % 10 == 2
    "#{num}nd"
  elsif num % 10 == 1
    "#{num}st"
  else
    "#{num}th"
  end
end

def number?(num)
  num.to_i.to_s == num
end

def ask_number
  input = nil
  loop do
    input = gets.chomp
    break if number?(input)
    puts "Please enter a number!"
  end
  input.to_i
end

def collect_numbers
  numbers = []
  (1..5).each do |num|
    puts ">> Enter the #{ordinal(num)} number:"
    numbers << ask_number
  end
  numbers
end

numbers = collect_numbers

puts ">> Enter the last number:"
last_number = ask_number

if numbers.include? last_number
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
