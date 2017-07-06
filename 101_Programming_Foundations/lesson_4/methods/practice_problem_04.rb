# practice_problem_04.rb

# Pick out the minimum age from our current Munster family hash:

ages = {
  "Herman" => 32,
  "Lily" => 30,
  "Grandpa" => 5843,
  "Eddie" => 10,
  "Marilyn" => 22,
  "Spot" => 237
}

ages_min = ages.min { |a, b|  a[1] <=> b[1] }
p ages_min

p ages.values.min
