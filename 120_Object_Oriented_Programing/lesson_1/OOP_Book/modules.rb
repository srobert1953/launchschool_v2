module Mamal
  class Dog
    def say_name(name)
      p "I am #{name}"
    end
  end

  class Cat
    def speak(words)
      p "I am saying #{words}"
    end
  end
end

buddy = Mamal::Dog.new
kitty = Mamal::Cat.new

buddy.say_name('arf!')
kitty.speak('miao')
