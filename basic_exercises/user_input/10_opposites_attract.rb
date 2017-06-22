# opposites_attract.rb

def valid_number? number_string
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_number
  number = nil
  loop do
    puts ">> Please enter a positive or negative integer:"
    number = gets.chomp
    return number.to_i if valid_number? number
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

number1 = nil
number2 = nil

loop do
  number1 = get_number
  number2 = get_number

  if number1 > 0 && number2 < 0 || number1 < 0 && number2 > 0
    break
  else
    puts "Sorry, one integer must be positive, one negative!"
  end
end

result = number1 + number2
puts "#{number1} + #{number2} = #{result}"

