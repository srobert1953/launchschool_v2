class Person
  attr_writer :name

  def name
    "Mr. #{@name}"
  end
end

person1 = Person.new
person1.name = "Robert"
puts person1.name
