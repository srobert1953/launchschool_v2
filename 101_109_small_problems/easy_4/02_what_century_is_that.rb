# what_century_is_that.rb

def ordinal(number)
  if [11, 12, 13].include? (number % 100)
    "#{number}th"
  elsif number % 10 == 1
    "#{number}st"
  elsif number % 10 == 2
    "#{number}nd"
  elsif number % 10 == 3
    "#{number}rd"
  else
    "#{number}th"
  end
end

def century(year)
  century = (year / 100) + 1
  century -= 1 if year % 100 == 0
  p century
  ordinal(century)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
