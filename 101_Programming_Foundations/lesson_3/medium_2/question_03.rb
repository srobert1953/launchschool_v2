# question_03.rb

# Let's call a method, and pass both a string and an array as parameters and see how even
# though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# => "My string looks like this now: pumpkins"
# => - nothing changed for the my_string, even it was passed to the method
puts "My array looks like this now: #{my_array}"
# => "My array looks like this now: ["pumpkins", "rutabaga"]"
# => - my_array was mutated by the method <<, and the changes are reflecting
#      outside of the method as well.
