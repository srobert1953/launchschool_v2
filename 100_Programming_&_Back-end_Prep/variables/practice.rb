# Practice sheet

puts "Enter a number:"
number = gets.chomp.to_i

def thousands number
  if number > 999
    return number / 1000 % 10
  else
    return nil
  end
end

def print_thousands number
  thousand = thousands number
  if thousand == nil
    puts "Your number #{number} doesn't have thousand's place."
  else
    puts "The number in thousand's position is #{thousand}"
  end
end

print_thousands number
