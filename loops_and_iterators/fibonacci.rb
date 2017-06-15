# fibonacci.rb

def fibonacci number
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

(1..10).each do |number|
  puts "#{number}: #{fibonacci(number)}"
end
