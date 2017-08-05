# matching_parentheses.rb

def balanced?(string)
  counter = 0
  string.chars.each do |char|
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
    end
    break if counter < 0
  end

  counter.zero?
end

p balanced?("What is (this)?")
p balanced?("This is )wrong(")
p balanced?("This is partial(")
p balanced?("No parent")
