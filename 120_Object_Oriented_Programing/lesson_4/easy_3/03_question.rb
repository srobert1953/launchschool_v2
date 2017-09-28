class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!"
  end
end

kitty = AngryCat.new(1, "Kitty")
cat = AngryCat.new(5, "Cat")

kitty.name
cat.name

kitty.age
cat.age
