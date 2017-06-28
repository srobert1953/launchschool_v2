# rps_lizard_spoc.rb

require 'yaml'

MESSAGES = YAML.load_file('rpsls_messages.yml')
LANG = 'en'
VALID_VALUES = %w(rock paper scissors lizard spock)
ABBREVIATION = %w(r p sc l sp)
WIN_COMBINATIONS = {
  scissors: ['paper', 'lizard'],
  paper: ['rock', 'spock'],
  rock: ['lizard', 'scissors'],
  lizard: ['spock', 'paper'],
  spock: ['scissors', 'rock']
}

def prompt(message)
  puts "=> #{message}"
end

def correct_choice?(answer)
  ABBREVIATION.include?(answer) || VALID_VALUES.include?(answer)
end

def full_name?(choice)
  VALID_VALUES.include? choice
end

def correct_answer?(str)
  str.start_with?('y', 'n')
end

def continue?(answer)
  answer.downcase.start_with? 'y'
end

def full_choice_name(choice)
  idx = ABBREVIATION.find_index choice
  VALID_VALUES[idx]
end

def winner(user, computer)
  if WIN_COMBINATIONS[user.to_sym].include? computer
    :user
  elsif WIN_COMBINATIONS[computer.to_sym].include? user
    :computer
  end
end

def messages(winner)
  case winner
  when :user then MESSAGES[LANG]['user_win']
  when :computer then MESSAGES[LANG]['computer_win']
  else MESSAGES[LANG]['tie']
  end
end

def update_score(score, winner)
  if winner == :user
    score[:user] += 1
  elsif winner == :computer
    score[:computer] += 1
  end
end

def grand_winner(score)
  if score[:user] > score[:computer]
    'YOU'
  else
    'COMPUTER'
  end
end

prompt MESSAGES[LANG]['welcome']

loop do # main loop
  round = 0
  score_card = { user: 0, computer: 0 }

  loop do
    puts ""
    prompt MESSAGES[LANG]['rounds'] + " #{round + 1}."
    choice = ''

    prompt "Choose one: #{VALID_VALUES.join(', ')}"
    loop do
      choice = gets.chomp
      break if correct_choice? choice
      prompt MESSAGES[LANG]['input_warning']
    end

    choice = full_choice_name(choice) unless full_name?(choice)
    computer_choice = VALID_VALUES.sample

    prompt "You: #{choice.upcase}, Computer: #{computer_choice.upcase}"
    winner = winner(choice, computer_choice)
    prompt messages(winner)

    round += 1
    update_score score_card, winner
    break if score_card.values.any? { |val| val == 5 }
  end

  width = 60
  puts ""
  puts " SCORE ".center(width, '-')
  puts  "YOU #{score_card[:user]}".ljust(width / 2) +
        "#{score_card[:computer]} COMPUTER".rjust(width / 2)
  puts MESSAGES[LANG]['grand_winner'] + " #{grand_winner(score_card)}"
  puts ""

  prompt MESSAGES[LANG]['continue']

  answer = ''
  loop do
    answer = gets.chomp
    break if correct_answer? answer
    prompt MESSAGES[LANG]['continue_warning']
  end

  break unless continue? answer
end

prompt MESSAGES[LANG]['good_bye']
