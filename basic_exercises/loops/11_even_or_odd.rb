# even_or_odd.rb

count = 1

loop do
  puts "#{count} is odd" if count.odd?
  puts "#{count} is even" if count.even?
  count += 1
  break if count > 5
end
