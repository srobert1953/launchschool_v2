# conditional_loop.rb

puts "Starting loop:"
i = 0
loop do
  if i % 2 == 0
    puts i
  end
  i += 1
  break if i > 10
end

# conditional_loop_with_next
puts "Starting conditional loop with next"
i = 0
loop do
  if i == 3
    puts "omitted"
    i += 1
    next
  elsif i.odd?
    puts i
  end
  i += 1
  break if i > 10
end

# conditional_wile_loop
puts "Starting conditional while loop"
i = 0
while i <= 10
  if i.odd?
    puts i
  end
  i += 1
end

#conditional_while_loop_with_next
puts "Starting conditional while loop with next"
i = 0
while i <= 10
  if i == 5
    puts "omitted"
    i += 1
    next
  elsif i.odd?
    puts i
  end
  i += 1
end

# conditional_while_loop_with_break
puts "Starting conditional while loop with break"
i = 0
while i <= 10
  if i == 7
    puts "Stopping"
    break
  elsif i.odd?
    puts i
  end
  i += 1
end

