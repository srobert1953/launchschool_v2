# question_04.rb

# To drive that last one home...let's turn the tables and have the string
# show a modified output, while the array thwarts the method's
# efforts to modify the caller's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
# => "My string looks like this now: pumpkinsrutabaga"
puts "My array looks like this now: #{my_array}"
# => "My array looks like this now: ["pumpkins"]"

# => Now string is mutated inside the method, and so it changes also outside,
# => But the array which is passed in to method is not used at all,
# => instead a new array is created, and then left over after the method ends
