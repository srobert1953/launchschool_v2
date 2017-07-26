# double_chart_1.rb

def repeater(string)
  result = []
  string.each_char do |char|
    result << char * 2
  end
  result.join('')
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
