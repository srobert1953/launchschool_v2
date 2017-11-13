name = 'Robert'
chunk_of_code = Proc.new { puts "Hi #{name}" }

def a_method(some_code)
  some_code.call
end

name = 'Eric'

a_method(chunk_of_code)

# array = ['Robert', 'aleXandra']
# capitalize_names = Proc.new { |string| puts string.capitalize }

# array.each(&capitalize_names)



