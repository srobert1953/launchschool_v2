class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 31

person2 = Person.new
person2.age = 28

puts person1.older_than?(person2)
