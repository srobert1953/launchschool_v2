# how_old_is_teddy.rb

def teddy_age(name='Teddy')
  age = (20...200).to_a.sample
  "#{name} is #{age} years old!"
end

p teddy_age('Robert')
p teddy_age("Alexandra")
p teddy_age
