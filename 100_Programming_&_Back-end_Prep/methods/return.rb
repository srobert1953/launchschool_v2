# return.rb

def add_number number
  number + 3
end

def add_four number
  return number + 4
end

def add_five number
  return number + 5
  number + 6
end

returned_value = add_number 4
puts returned_value

returned_value = add_four 5
puts returned_value

returned_value = add_five 5
puts returned_value

def just_assignement number
  puts number + 3
end

returned_value = just_assignement 4
puts returned_value
