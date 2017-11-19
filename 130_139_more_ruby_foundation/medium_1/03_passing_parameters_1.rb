def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Let's start gathering food."
end

items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |items|
  puts "#{items.join(', ')}"
end
