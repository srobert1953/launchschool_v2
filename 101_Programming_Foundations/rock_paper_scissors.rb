# rock_paper_scissors.rb

VALID_VALUES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  combinations = {
    ['rock', 'scissors'] => true,
    ['paper', 'rock'] => true,
    ['scissors', 'paper'] => true
  }
  combinations[[first, second]]
end

def messages(user, computer)
  if win?(user, computer)
    "You won!"
  elsif win?(computer, user)
    "Computer won!"
  else
    "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_VALUES.join(', ')}"
    choice = gets.chomp
    break if VALID_VALUES.include? choice
    prompt "You didn't choose valid value!"
  end

  computer_choice = VALID_VALUES.sample

  prompt "You choose: #{choice}. Computer choose: #{computer_choice}."

  prompt messages(choice, computer_choice)

  prompt "Do you want to play again? ('y' to continue)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing!"
