# print_somehting_02.rb

puts "Do you want me to print something? (y/n)"

loop do
  answ = gets.chomp.downcase
  if answ == 'y' || answ == 'n'
    puts "something" if answ == 'y'
    break
  else
    puts "Invalid input, Please enter y or n"
  end
end

# launchschool Solution:
puts " Launchschool solution ".center(50, '#')
choise = nil
loop do
  puts ">> Do you want me to print something? (y/n)"
  choise = gets.chomp.downcase
  break if %w(y n).include?(choise)
  puts ">> Invalid input! Please enter y or n"
end
puts "something" if choise == 'y'
