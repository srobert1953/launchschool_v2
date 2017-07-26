# multiplicative_avarage.rb

def show_multiplicative_average(numbers)
  avarage = numbers.inject(:*) / numbers.size.to_f
  puts format("The result is %.3f", avarage)
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
