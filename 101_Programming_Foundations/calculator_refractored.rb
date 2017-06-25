# calculator_refractored.rb

def prompt str
  puts "=> #{str}"
end

def valid_number? number
  number == number.to_i.to_s
end

def get_number turn
  number = ''
  loop do
    prompt "Please enter the #{turn} number:"
    number = gets.chomp

    if valid_number? number
      break
    else
      prompt "This doesn't look like an integer..."
    end
  end
  number
end

loop do # main loop
  number1 = get_number "first"

  number2 = get_number "second"

  operator_prompt = <<-MSG
    Please choose an operation:
    1) add,
    2) subtract,
    3) multiply,
    4) divide
  MSG

  prompt operator_prompt
  operation = ''
  loop do
    operation = gets.chomp
    if %w(1 2 3 4 ).include? operation
      break
    else
      prompt "Please choose 1, 2, 3, or 4."
    end
  end

  result = case operation
           when '1' then number1.to_i + number2.to_i
           when '2' then number1.to_i - number2.to_i
           when '3' then number1.to_i * number2.to_i
           when '4' then number1.to_f / number2.to_f
           end

  prompt "The result is #{result}"

  prompt "Do you want to perform another operation? (Y to continue)"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end # end main loop
