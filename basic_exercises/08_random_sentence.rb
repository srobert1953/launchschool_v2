# random_sentence.rb

def name arr
  arr.sample
end

def activity arr
  arr.sample
end

def sentence name, activity
  "#{name} went #{activity} today."
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

12.times { puts sentence(name(names), activity(activities)) }
