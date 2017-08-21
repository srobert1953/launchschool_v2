# good_dog.rb

module Speak
  def speak(words)
    puts words
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

dogy = GoodDog.new
dogy.speak('Haf!')
bob = HumanBeing.new
bob.speak('Hello!')

puts "GoodDog ancestors:"
puts GoodDog.ancestors
puts "HumanBeing ancestors:"
puts HumanBeing.ancestors
