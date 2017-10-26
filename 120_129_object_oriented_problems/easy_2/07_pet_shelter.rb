class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.count
  end

  def add_pet(pet)
    @pets.push pet
  end

  def print_pets
    pets.each { |pet| puts pet }
  end
end

class Shelter
  attr_reader :not_adopted

  def initialize
    @adopters = []
    @not_adopted = []
  end

  def adopt(owner, pet)
    adopters.push(owner) unless adopters.include?(owner)
    owner.add_pet(pet)
  end

  def for_adoption(pet)
    not_adopted.push pet
  end

  def print_adoptions
    adopters.each do |adopter|
      puts "#{adopter.name} has adopted the following pets:"
      adopter.print_pets
      puts ''
    end
  end

  def print_for_adoption
    puts 'The Animal Shelter has the following unadopted pets'
    not_adopted.each do |pet|
      puts pet
    end
  end

  private

  attr_reader :adopters
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions

shelter.for_adoption(asta)
shelter.for_adoption(laddie)
shelter.for_adoption(fluffy)
shelter.for_adoption(kat)
shelter.for_adoption(ben)
shelter.for_adoption(chatterbox)
shelter.for_adoption(bluebell)

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

shelter.print_for_adoption
