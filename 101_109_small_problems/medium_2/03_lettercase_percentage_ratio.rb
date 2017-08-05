# lettercase_percentage_ratio.rb

# => Collect letter counts for lowercase, uppercase, neither
# => Calculate percentage

def recalculate_to_percentage(hash)
  total = hash.inject(0) { |memo, object| memo += object[1] }
  hash.each do |key, value|
    percent = (value * 100 / total.to_f)
    percent =  percent > percent.to_i ? percent.round(1) : percent.to_i
    hash[key] = percent
  end
end

def letter_percentages(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
    string.chars.each do |char|
      if char =~ /[a-z]/
        result[:lowercase] += 1
      elsif char =~ /[A-Z]/
        result[:uppercase] += 1
      else
        result[:neither] += 1
      end
    end
  recalculate_to_percentage(result)
end

p letter_percentages("abCdef 123")
p letter_percentages("AbCd +Ef")
p letter_percentages("123a")
