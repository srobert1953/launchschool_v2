# dividing_numbers.rb

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def collect_number_for(fraction)
  number = nil

  loop do
    puts ">> Please enter the #{fraction}:"
    number = gets.chomp

    if fraction == "denominator" && number == "0"
      puts "Invalid input. A denominator of 0 is not allowed."
    elsif valid_number?(number) == false
      puts "Invalid input. Only integers are allowed."
    else
      break
    end

  end
  number.to_i
end

numerator = collect_number_for("numerator")
denominator = collect_number_for("denominator")
result = numerator / denominator
puts ">> #{numerator} / #{denominator} is #{result}"

