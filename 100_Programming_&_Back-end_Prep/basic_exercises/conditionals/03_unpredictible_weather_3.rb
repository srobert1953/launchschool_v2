# unpredictible_weather_3.rb

sun = ["visible", "hidden"].sample

puts "The sun is too bright!" if sun == "visible"
puts "The clouds are blocking the sun!" unless sun == "visible"
