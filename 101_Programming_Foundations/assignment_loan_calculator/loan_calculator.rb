# loan_calulator.rb

require 'yaml'
LANG = 'en'
MESSAGES = YAML.load_file('loan_calculator_messages.yml')
WIDTH = 45

def prompt(message)
  print "\n=> #{message}"
end

def name?(string)
  /^[a-z|A-Z]*\'?[a-z|A-Z]*$/.match string
end

def dollars?(amount)
  /^\$?\ *[0-9]+\.?[0-9]?[0-9]?$/.match amount
end

def number?(num)
  /^[0-9]+\.?[0-9]?[0-9]?\ *\%?$/.match num
end

def years?(years)
  is_year = years == years.to_i.to_s
  is_year && years.to_i <= 30 ? true : false
end

def create_number(str)
  number = str.split('').select { |i| i.to_i > 0 || i == '0' || i == '.' }
  number = number.join.to_f
  number
end

prompt MESSAGES[LANG]['welcome']
prompt MESSAGES[LANG]['your_name']

name = ''
loop do
  name = gets.chomp.capitalize
  break if name? name
  prompt MESSAGES[LANG]['warning_name']
end

prompt MESSAGES[LANG]['introduction']

loan_amount = ''
loop do
  prompt MESSAGES[LANG]['loan_amount'].ljust(WIDTH - 4, '.') + ': '.rjust(2)
  loan_amount = gets.chomp
  break if dollars? loan_amount
  prompt MESSAGES[LANG]['warning_amount']
end

apr = ''
loop do
  prompt MESSAGES[LANG]['apr'].ljust(WIDTH - 4, '.') + ': '.rjust(2)
  apr = gets.chomp
  break if number? apr
  prompt MESSAGES[LANG]['warning_number']
end

loan_duration_years = ''
loop do
  prompt MESSAGES[LANG]['loan_duration'].ljust(WIDTH - 4, '.') + ': '.rjust(2)
  loan_duration_years = gets.chomp
  break if years? loan_duration_years
  prompt MESSAGES[LANG]['warning_years']
end

loan_amount = create_number(loan_amount)
apr = create_number(apr)
loan_dur_years = loan_duration_years.to_i
loan_dur_months = loan_dur_years * 12
monthly_rate = apr / 12 / 100

partial_calc = monthly_rate / (1 - (1 + monthly_rate)**(-1 * loan_dur_months))
monthly_installment = loan_amount * partial_calc

def result_message(ann, num, sym = '')
  width_third = WIDTH / 3
  width_two_thirds = (WIDTH / 3) * 2
  msg_start = MESSAGES[LANG][ann].ljust(width_two_thirds, '.')
  msg = case sym
        when '$'
          num = format("%.2f", num)
          msg_start + " #{sym} #{num}".rjust(width_third, '.')
        when '%'
          num = format("%.2f", num)
          msg_start + " #{num} #{sym}".rjust(width_third, '.')
        else
          msg_start + " #{num}".rjust(width_third, '.')
        end
  print "\n#{msg}\n"
end

puts ""
puts " #{name} #{MESSAGES[LANG]['result']} ".center(WIDTH, '-')
result_message('result_amount', loan_amount, '$')
result_message('result_apr', apr, '%')
result_message('result_years', loan_duration_years)
result_message('result_payment', monthly_installment, '$')
puts ""
