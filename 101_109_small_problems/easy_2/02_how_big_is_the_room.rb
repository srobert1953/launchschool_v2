# how_big_ist_the_room.rb

METERS_TO_FEET = 10.7639

puts "what is the room width?:"
width = gets.chomp.to_f

puts "Whit is the room length?:"
length = gets.chomp.to_f

area = width * length
area_in_feet = area * METERS_TO_FEET

puts "The room area is #{area} sq meters (#{area_in_feet} sq feet)"
