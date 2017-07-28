# grade_book.rb

def get_grade(score1, score2, score3)
  avarage = (score1 + score2 + score3) / 3
  case
  when avarage >= 90 && avarage <= 100
    'A'
  when avarage >= 80 && avarage < 90
    'B'
  when avarage >= 70 && avarage < 80
    'C'
  when avarage >= 60 && avarage < 70
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Launch School Solution

def get_grade(score1, score2, score3)
  result = (score1 + score2 + score3) / 3

  case result
  when 90...100 then 'A'
  when 80..90 then 'B'
  when 70..80 then 'C'
  when 60..70 then 'D'
  else 'E'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
