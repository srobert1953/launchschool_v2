# practice_problem_07.rb

# Create a hash that expresses the frequency with which
# each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

result = statement.split('').each_with_object({}) do |obj, hash|
  if hash[obj].nil?
    hash[obj] = 1
  else
    hash[obj] += 1
  end
end

p result
