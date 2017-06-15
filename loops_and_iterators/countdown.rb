# countdown.rb

puts "Countdown from:"

count_from = gets.chomp.to_i
count = count_from

while count_from >= 0
  puts count_from
  count_from -= 1
end

puts "Done!"

width = 90

while count >= 0
  puts "#{count}".center(width)
  count -= 1
end

puts "Done!".center width

count = 10

until count <= 0
  puts "#{count}".center(width)
  count -= 1
end
