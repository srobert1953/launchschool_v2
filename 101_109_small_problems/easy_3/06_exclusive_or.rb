# exclusive_or.rb

def xor?(expression1, expression2)
  (expression1 && !expression2) || (expression2 && !expression1)
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?(false, false) == false
