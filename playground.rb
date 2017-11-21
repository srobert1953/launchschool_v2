def my_method(name, surname)
  puts "My name: #{name}"
  puts "My surname: #{surname}"
end

my_proc = method(:my_method).to_proc

{ 'Robert': 'Szabo'}.each &my_proc
