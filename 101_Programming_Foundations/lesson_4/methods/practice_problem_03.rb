# practice_problem_03.rb

# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

young_ages = ages.select do |_, age|
  age < 100
end

p young_ages

ages.select! { |_, age| age < 100}

p ages
