# regex.rb

def have_a_r? string
  if string =~ /r/
    puts "We have a match"
  else
    puts "No match"
  end
end

have_a_r? "Robert"
have_a_r? "Alexandra"
have_a_r? "phone"
have_a_r? "Colombo"

def has_a_b? string
  if /b/.match string
    puts "B is there"
  else
    puts "B is not there"
  end
end

has_a_b? "Robert"
has_a_b? "Alexandra"
has_a_b? "monument"
has_a_b? "bicycle"
