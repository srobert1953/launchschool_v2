# only_even.rb

number = 0

until number == 10
  number += 1
  if number.even?
    puts "#{number}"
  else
    next
  end
end
