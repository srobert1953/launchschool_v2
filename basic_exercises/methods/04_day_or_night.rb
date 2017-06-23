# day_or_night.rb

def day_or_night daylight
  if daylight
    puts "It's daytime!"
  else
    puts "Time to sleep, it's night!"
  end
end

daylight = [true, false].sample


day_or_night daylight
