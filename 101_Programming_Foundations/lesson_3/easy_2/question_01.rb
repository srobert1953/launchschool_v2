# question_01.rb

# In this hash of people and their age,

ages = {  "Herman" => 32,
          "Lily" => 30,
          "Grandpa" => 402,
          "Eddie" => 10 }

# see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as
# well for this solution?

p ages["Spot"] != nil
p ages.has_key? "Spot"
p ages.key("Spot") != nil
p ages.include? "Spot"
p ages.member? "Spot"
