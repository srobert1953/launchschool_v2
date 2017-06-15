# arrays.rb

arr = [1, 4.56, "Robert", "Prague"]

last = arr.last
puts last
p arr

first = arr.first
puts first
p arr

pop = arr.pop
p arr

arr.push pop
p arr

manipulated_arr = arr.map do |item|
  if item.is_a? Integer
    item * 3
  elsif item.is_a? String
    item.upcase
  else
    item
  end
end
p manipulated_arr

arr.unshift "Monsters"
p arr

p arr.to_s
