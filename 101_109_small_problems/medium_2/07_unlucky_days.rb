# unlucky_days.rb

=begin
- input: integer
  - a year greater than 1752
- output: integer
  - sum of all Friday 13th in given year
- assumptions:
  - N/A
- test cases:
  friday_13th(2015) == 3
  friday_13th(1986) == 1
  friday_13th(2019) == 2
=end

# => define a method #friday_13th with one parameter as a year
# => SET the result as 0
# => SET a range from 1 until 12 including representing months
# => iterate over the range where in a block do:
# =>   - create a new Time where:
# =>     - year is an argument from the method
# =>     - months is a value passed to the block from
# =>     - day is 13
# =>   - with each iteration check if the given Time is Friday
# =>     - if yes, increment the result by one
# => return the result

def friday_13th(year)
  result = 0
  (1..12).each do |month|
    result += 1 if Time.new(year, month, 13).friday?
  end

  result
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
