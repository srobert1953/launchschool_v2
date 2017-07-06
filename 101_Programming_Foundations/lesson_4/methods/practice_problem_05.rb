# practice_problem_05.rb

# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

# Actually, this solution does not return a first index, but the last one.
# So it doesn't met the assignment criteria
first_index = nil
flintstones.each_with_index do |obj, idx|
  if obj.start_with? "Be"
    first_index = idx
  end
end

p first_index

# Launch school solution

p flintstones.index { |name| name.start_with? 'Be' }
