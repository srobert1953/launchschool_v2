# random_loop.rb

loop do
  number = rand(1..10)
  puts "Hello!"
  if number == 5
    puts "Exiting..."
    break
  end
end
