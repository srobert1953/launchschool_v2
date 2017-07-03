# question_02.rb

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id # ID01
  b_outer_id = b_outer.object_id # ID02
  c_outer_id = c_outer.object_id # ID03
  d_outer_id = d_outer.object_id # ID03_1(ID01)

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  # => 42, ID01
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  # => "forty two", ID02
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  # => [42], ID03
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"
  # => 42, ID03_1(ID01)

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  # => 42, ID01, ID01
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  # => "forty two", ID02, ID02
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  # => [42], ID03, ID03
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"
  # => 42, ID03_1(ID01), ID03_1(ID01)

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # => a_inner doesn't exist here
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # => b_inner doesn't exist here
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  # => c_inner doesn't exist here
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
  # => d_inner doesn't exist here
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id # ID01
  b_outer_inner_id = b_outer.object_id # ID02
  c_outer_inner_id = c_outer.object_id # ID03
  d_outer_inner_id = d_outer.object_id # ID03_1(ID01)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  # => ID01, ID01
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  # => ID02, ID02
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  # => ID03, ID03
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"
  # => ID03_1(ID01), ID03_1(ID01)

  a_outer = 22              # ID11
  b_outer = "thirty three"  # ID12
  c_outer = [44]            # ID13
  d_outer = c_outer[0]      # ID13_1

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  # => 22, ID01, ID11
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  # => "thirty three", ID02, ID12
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  # => [44], ID03, ID13
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"
  # => 44, ID03_1(ID01), ID13_1


  a_inner = a_outer     # ID11
  b_inner = b_outer     # ID12
  c_inner = c_outer     # ID13
  d_inner = c_inner[0]  # ID13_1

  a_inner_id = a_inner.object_id # ID11
  b_inner_id = b_inner.object_id # ID12
  c_inner_id = c_inner.object_id # ID13
  d_inner_id = d_inner.object_id # ID13_1

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  # => 22, ID11, ID11
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  # => "thirty three", ID12, ID12
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  # => [44], ID13, ID13
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
  # => 44, ID13_1, ID13_1
end
