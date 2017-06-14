# case_statement.rb

puts "What is your name:"
name = gets.chomp

puts case name.capitalize
when "Robert"
  "The perfect name."
when "Alexandra"
  "Is this your sister?"
when "Peter"
  "Very common name there..."
when "Katarina"
  "The best name of them all."
else
  "So ordinary."
end

puts "How old are you?"
age = gets.chomp.to_i

answer = case
when age <= 0
  "Are you sure you are alive?"
when age <= 12
  "You are still a child!"
when age <= 18
  "A teenager of despair."
when age <= 25
  "Still studying?"
when age <= 30
  "Your best years are over!"
when age <= 40
  "The best times of your life"
when age <= 55
  "Work and work harder"
when age <= 100
  "Just seat back, enjoy and relax."
else
  "Surprised you can still read, congratulations!"
end

puts answer
