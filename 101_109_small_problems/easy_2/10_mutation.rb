array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# => ['Moe', 'Larry', 'CURLY', 'SHEMP', 'Harpo', 'CHICO', 'Groucho', 'Zeppo']

# => We are mutating the assigned value which is referenced to both arrays.
# => So the mutated values are changed in both arrays.
