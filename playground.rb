def fibonacci_last(nth)
  last = [1, 1]
  3.upto(nth) do |num|
    last = [last.last, (last.first + last.last) % 10]
    p num
  end
  last.last
end

# p fibonacci_last(3)
p fibonacci_last(123456789)
