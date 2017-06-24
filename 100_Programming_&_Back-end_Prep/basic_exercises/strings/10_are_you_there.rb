# are_you_there.rb

colors = 'blue pink yellow orange'

p colors.include? "yellow"
p colors.include? "purple"

colors = 'blue boredom yellow'
p colors.include? "red"
# => true
# => include? checks if the string is included, not a word
