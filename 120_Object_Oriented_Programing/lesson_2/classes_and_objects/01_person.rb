# 01_person.rb

class Person
  attr_accessor :name

  def initialize(name)
    self.name = name
  end
end

bob = Person.new('Bob')
p bob.name
bob.name = 'Robert'
p bob.name
