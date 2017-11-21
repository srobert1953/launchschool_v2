factors = Enumerator.new do |f|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    f << accumulator
    number += 1
  end
end

# => External iterator
7.times { puts factors.next }

# => Internal iterator
factors.each_with_index do |num, idx|
  puts num
  break if idx == 6
end
