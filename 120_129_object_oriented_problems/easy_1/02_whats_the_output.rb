class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    name = @name.upcase
    "My name is #{name}"
  end
end

# name = "Fluffy"
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# => The above produces 42 when calling getter method #name on line 24 and 26.
# => The initialize method is assigning a new String object to the name instance variable
# => But when we increment the Integer 42 assigned to local variable name on line 23,
# => the local variable name is then assigned to an Integer object 43
# => Therefore when we call method puts with argument name it displays 43 on line 27
