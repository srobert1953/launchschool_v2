# calculator_refractored.rb

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def prompt(str)
  puts "=> #{str}"
end

def integer?(number)
  /^\d+$/.match(number)
end

def float?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def get_number(turn)
  number = ''
  loop do
    prompt MESSAGES[LANGUAGE][turn]
    number = gets.chomp
    break if valid_number? number
    prompt MESSAGES[LANGUAGE]['integer_warning']
  end
  number
end

def operand
  prompt MESSAGES[LANGUAGE]['operator_prompt']

  operation = ''
  loop do
    operation = gets.chomp
    break if %w(1 2 3 4).include? operation
    prompt MESSAGES[LANGUAGE]['operator_warning']
  end
  operation
end

prompt MESSAGES[LANGUAGE]['welcome']

loop do # main loop
  number1 = get_number "first_number"
  number2 = get_number "second_number"
  operation = operand
  result = case operation
           when '1' then number1.to_i + number2.to_i
           when '2' then number1.to_i - number2.to_i
           when '3' then number1.to_i * number2.to_i
           when '4' then number1.to_f / number2.to_f
           end

  prompt MESSAGES[LANGUAGE]['result'] + result.to_s

  prompt MESSAGES[LANGUAGE]['another_operation']
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end # end main loop
