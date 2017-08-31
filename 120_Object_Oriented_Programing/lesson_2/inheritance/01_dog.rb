# 01_dog.rb

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

puts "--- tedy Dog ---"
tedy = Dog.new
puts tedy.speak
puts tedy.swim
puts tedy.run
puts tedy.jump
puts ''

puts "--- buldy Bulldog ---"
buldy = Bulldog.new
puts buldy.speak
puts buldy.swim
puts ''

puts "--- kitty Cat---"
kitty = Cat.new
puts kitty.speak
puts kitty.run
puts kitty.jump
puts ''

puts "### Class hierarchy of Pet:"
p Pet.ancestors
puts ''

puts '### Class hierarchy of Dog:'
p Dog.ancestors
puts ''

puts '### Class hierarchy of Bulldog:'
p Bulldog.ancestors
puts ''

puts '### Class hierarchy of Cat:'
p Cat.ancestors
