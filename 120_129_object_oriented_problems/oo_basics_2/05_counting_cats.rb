class Cat
  @@cat_count = 0

  def initialize
    @@cat_count += 1
  end

  def self.total
    puts "Total Cats: #{@@cat_count}"
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
