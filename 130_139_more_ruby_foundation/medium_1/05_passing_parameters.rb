items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, last|
  puts "#{items.join(', ')}"
  puts last
end

puts ''

gather(items) do |item1, *items, item3|
  puts item1
  puts "#{items.join(', ')}"
  puts item3
end

puts ''

gather(items) do |item, *items|
  puts item
  puts "#{items.join(', ')}"
end

puts ''

gather(items) do |item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, #{item4}"
end
