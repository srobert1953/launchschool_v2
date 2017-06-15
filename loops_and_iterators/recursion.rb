# recursion.rb

def doubler number
  puts number * 2
end

def doubler number
  puts number
  if number < 10
    doubler(number * 2)
  end
end

doubler 10

