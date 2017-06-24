# exception_handeling.rb

names = ["Robert", "Alexandra", nil, "Peter"]

names.each do |name|
  begin
    puts "#{name} has length #{name.length} characters"
  rescue
    puts "Something went wrong"
  end
end

zero = 0
puts "Begin execute"
zero.each { |num| num } rescue puts "Cannot do that"
puts "End execute"

def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide 16, 4
puts divide 13, 0
puts divide 13, 7
