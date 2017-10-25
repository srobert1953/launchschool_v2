class Person
  def name=(full_name)
    @first_name, @last_name = full_name.split
  end

  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = "Robert Szabo"
puts person1.name
