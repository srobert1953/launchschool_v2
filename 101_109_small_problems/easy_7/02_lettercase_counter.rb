# lettercase_counter.rb

def letter_case_count(letters)
  result = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }
  letters.chars do |char|
    if ('a'..'z').include? char
      result[:lowercase] += 1
    elsif ('A'..'Z').include? char
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Launch School Solution

def letter_case_count(letters)
  result = {}
  characters = letters.chars
  result[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  result[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  result[:neither]   = characters.count { |char| char =~ /[^a-zA-Z]/ }

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
