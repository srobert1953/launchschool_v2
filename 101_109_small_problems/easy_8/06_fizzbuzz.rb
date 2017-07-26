# fizzbuzz.rb

def fizbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

def fizzbuzz(starting, ending)
  result = []
  (starting..ending).each do |number|
    result << fizbuzz_value(number)
  end
  result.join(', ')
end

p fizzbuzz(1, 15)
