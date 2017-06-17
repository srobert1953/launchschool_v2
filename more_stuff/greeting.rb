# greeting.rb

def greet person
  puts "Hello " + person
end

greet "Robert"
# greet 1

def space_out_letters person
  return person.split("").join(" ")
end

def greet person
  return "H e l l o   " + space_out_letters(person)
end

def decorate_greeting person
  puts "" + greet(person) + ""
end

decorate_greeting "Robert"
decorate_greeting 1
