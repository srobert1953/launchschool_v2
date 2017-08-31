# 02_person.rb

class Person
  attr_accessor :first_name, :last_name

  def initialize(fn, ls = '')
    self.first_name = fn
    self.last_name = ls
  end

  def name
    if self.last_name == ''
      self.first_name
    else
      self.first_name + ' ' + self.last_name
    end
  end
end

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
bob.first_name              # => 'Robert'
bob.last_name               # => ''
bob.last_name = 'Smith'
p bob.name
