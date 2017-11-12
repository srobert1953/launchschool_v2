def say(word)
  puts word
  sleep 2
  yield if block_given?

end

say('Hello') do
  system 'clear'
end
