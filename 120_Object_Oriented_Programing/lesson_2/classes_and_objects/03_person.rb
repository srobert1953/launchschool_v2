# 03_person.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    split_name(full_name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    split_name(full_name)
  end

  private

  def split_name(name)
    array_name = name.split
    @first_name = array_name.first
    @last_name = array_name.size > 1 ? array_name.last : ''
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
bob.first_name = "Alexander"
p bob.name

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob.name == rob.name
