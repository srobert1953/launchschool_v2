# say_hello.rb

say_hello = true
count = 1
while say_hello
  puts "Hello!"
  say_hello = false if count == 5
  count += 1
end
