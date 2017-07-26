# staggered_caps.rb

def staggered_case(sentence)
  result = ''
  need_upcase = true
  sentence.chars.each do |char|
    if need_upcase
      result << char.upcase
    else
      result << char.downcase
    end
    next if char =~ /[^a-zA-Z]/

    need_upcase = !need_upcase
  end
  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

def staggered_case(sentence, non_character = false)
  result = ''
  need_upcase = true
  sentence.chars.each do |char|
    if need_upcase
      result << char.upcase
    else
      result << char.downcase
    end

    if non_character
      next if char =~ /[^a-zA-Z]/
    end

    need_upcase = !need_upcase
  end
  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', true) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 nUmBeRs'
