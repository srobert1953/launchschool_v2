def compare(str)
  puts "Before yield: #{str}"
  after = yield(str)
  puts "After yield: #{after}"
end

compare('Hi') { |word| word.upcase }

compare('Hello') { |word| word.slice(1, 3) }

compare('Robert') { |word| "Nothing to do with word" }

compare('My string') { |word| puts word }
