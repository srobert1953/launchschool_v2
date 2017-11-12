def increment(number)
  if block_given?
    puts "Yield numbers:" + yield(number + 1).to_s
  else
    number + 1
  end
end

# puts increment(5)

increment(5) do |num|
  puts "Block number" + num.to_s
  num
end

def test
  yield(3, 4)
end

test do |num1, num2|
  puts "#{num1} + #{num2}"
end
