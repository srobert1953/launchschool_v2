def echo(word)
  yield if block_given?
  word
end

puts echo('Robert') { puts 'Is calling a block'}
puts echo('Alexandra', 'Robert') { puts 'Passed block with wrong method arguments'}
