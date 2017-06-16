# file.rb

file_name = "my_file.txt"
hash = { name: "Robert", age: 31, city: "Prague"}

sample = File.open(file_name, 'w')
sample.puts "First Line"
sample.close

File.open(file_name, 'a+') do |file|
  file << "Some other line\n"
  hash.each { |key, value| file << "#{key}: #{value}\n"}
end

File.readlines(file_name).each do |line|
  puts line
end

simple = File.read file_name

new_copy = File.new("copy_file.txt", 'w')
File.open(new_copy, 'a') do |file|
  file.puts simple
end

