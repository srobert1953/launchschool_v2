# for_loop.rb

puts "Countdown from:"
count = gets.chomp.to_i

p for i in 1..count do
  puts i
end
puts "Done!"

count_array = [1, 2, 3, 4, 5, 6, 7]
p for i in count_array do
  puts i
end
puts "Done!"
