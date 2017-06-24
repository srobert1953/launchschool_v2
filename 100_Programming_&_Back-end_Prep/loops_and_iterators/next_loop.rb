# next_loop.rb

i = 0
loop do
  i += 1
  if i == 4
    next
  end
  if i % 2 == 0
    puts i
  end
  break if i > 10
end
