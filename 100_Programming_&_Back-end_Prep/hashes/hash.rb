# hash.rb

hash = Hash.new

hash[:name] = "Robert"
hash[:age] = 31
hash[:city] = "Prague"

hash.each { |key, value| puts "#{key.to_s}: #{value}"}

def greeting name, hash = {}
  if hash.empty?
    puts "Welcome #{name}"
  else
    puts "Welcome #{name}. You live in #{hash[:city]}, and you are #{hash[:age]} years old."
  end
end

greeting "Robert", hash

p hash.fetch "age", "The key doesn't exist"
