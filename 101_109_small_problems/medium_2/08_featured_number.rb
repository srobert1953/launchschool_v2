# featured_number.rb

=begin
- input: integer
- output: integer, or error message
  - a featured number which is:
    - greater then the argument
    - multiple of 7
    - is odd
    - digits do not appear more then once
- assumptions:
  - no featured number after 9_999_999_999
  - if feature number as argument, next feature number is given
=end

# => define a method #featured whit one parameter as a single integer
# => check if given number is featured with method #featured?
# => increment given number by one until featured is true

# => method #featured?: given a integer, check if
# =>   number is multiples of 7
# =>   is odd
# =>   digits do not appear more than once
# => returns true or false

def featured?(number)
  array_number = number.to_s.split('')

  number % 7 == 0 &&
  number.odd? &&
  array_number.uniq == array_number
end

def featured(number)
  return "There is no possible featured number" if number >= 9_876_543_210
  featured_number = number
  loop do
    if featured_number % 7 == 0
      featured_number += 7
    else
      featured_number += 1
    end
    break if featured?(featured_number)
  end

  featured_number
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999)
