# welcome_stranger.rb

def greetings(array, hash)
  result = 'Hello, '
  result << array.join(' ')
  result << "! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
