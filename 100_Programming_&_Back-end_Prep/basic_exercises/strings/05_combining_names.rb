# combining_names.rb

first_name = "John"
last_name = "Doe"

full_name = first_name + ' ' + last_name
puts full_name

full_name = "#{first_name} #{last_name}"
puts full_name

full_name = %(#{first_name} #{last_name})
puts full_name
