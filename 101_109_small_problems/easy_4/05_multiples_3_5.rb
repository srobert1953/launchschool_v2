# multiples_3_5.rb

def multisum(num)
  sum = 0
  (1..num).each do |n|
    if (n % 3 == 0 || n % 5 == 0)
      sum += n
    end
  end
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
