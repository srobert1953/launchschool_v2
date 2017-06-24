# iterators.rb

names = ['Robert', 'Alexandra', 'Margita', 'Katarina', 'Robert']
i = 1

names.each { |name| puts name }

names.each do |name|
  puts "#{i}. #{name}"
  i += 1
end
