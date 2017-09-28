class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello!")
  end

  def hi
    message("Hello")
  end
end

class Goodbye < Greeting
  def bye
    message("Goodbye")
  end
end

Hello.hi
