# 1000_lights.rb
require 'pry'

NUMBER_OF_SWITCHES = 1000
TOGGLES = NUMBER_OF_SWITCHES

def switches_on(switches)
  result = []
  switches.each_with_index do |switch, idx|
    result << idx + 1 if switch == 1
  end
  result
end

def count_on(switches)
  switches.find_all { |i| i == 1 }.size
end

def display_on(on_switches)
  case on_switches.size
  when 1 then "#{on_switches[0]}"
  when 2 then "#{on_switches[0]} and #{on_switches[1]}"
  else
    on_switches[-1] = "and #{on_switches[-1]}"
    on_switches.join(', ')
  end
end

switches = [0] * NUMBER_OF_SWITCHES

repetitions = 1
loop do
  counter = repetitions
  current_switch = counter - 1
  loop do
    switches[current_switch] = switches[current_switch] == 1 ? 0 : 1
    current_switch += counter
    break if current_switch >= NUMBER_OF_SWITCHES
  end
  repetitions += 1
  break if repetitions > TOGGLES
end

on = count_on(switches)
puts "The result is, that #{on} lights #{on == 1 ? "is" : "are" } left on: #{display_on(switches_on(switches))}"

# My second solution with Hash:

# NUMBER_OF_SWITCHES = 1000

# lights = Hash.new
# (1..NUMBER_OF_SWITCHES).each { |num| lights[num] = 'off' }

# (1..NUMBER_OF_SWITCHES).each do |idx|
#   counter = idx
#   while counter <= lights.size
#     lights[counter] = lights[counter] == 'on' ? 'off' : 'on'
#     counter += idx
#   end
# end

# p lights.select { |_,val| val == 'on'}


