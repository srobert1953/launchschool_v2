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
ANSWERS = {
  "scissors" => ["cuts Paper", "decapitates Lizard"],
  "paper" => ["covers Rock", "disproves Spock"],
  "rock" => ["crashes Lizard", "as it always has, crashes Scissors"],
  "lizard" => ["poisons Spock", "eats Paper"],
  "spock" => ["smashes Scissors", "vaporises Rock"]
}

def prompt(message)
  puts "=> #{message}"
end

def clear_screen
  system("cls") || system("clear")
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

def description(user, computer, winner)
  case winner
  when :user
    idx = WIN_COMBINATIONS[user.to_sym].find_index computer
    user.capitalize + " " + ANSWERS[user][idx]
  when :computer
    idx = WIN_COMBINATIONS[computer.to_sym].find_index user
    computer.capitalize + " " + ANSWERS[computer][idx]
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

def display_score(card)
  width = 42
  puts ""
  puts " SCORE ".center(width, '-')
  puts  "YOU #{card[:user]}".ljust(width / 2) +
        "#{card[:computer]} COMPUTER".rjust(width / 2)
  puts ""
end

def game_over?(score)
  score.values.any? { |val| val == 5 }
end

def display_wrong_choise(count)
  if count < 1
    prompt MESSAGES[LANG]['input_warning']
  else
    prompt MESSAGES[LANG]['short_input_warning']
  end
end

loop do # main loop
  round = 0
  score_card = { user: 0, computer: 0 }

  clear_screen

  prompt MESSAGES[LANG]['welcome']

  loop do
    prompt MESSAGES[LANG]['rounds'] + " #{round + 1}."
    choice = ''
    wrong_choise_count = 0

    prompt "#{VALID_VALUES.join(', ')}?"
    loop do
      choice = gets.chomp.downcase
      break if correct_choice? choice
      display_wrong_choise wrong_choise_count
      wrong_choise_count += 1
    end

    choice = full_choice_name(choice) unless full_name?(choice)
    computer_choice = VALID_VALUES.sample

    prompt "You: #{choice.upcase}, Computer: #{computer_choice.upcase}"

    winner = winner(choice, computer_choice)
    prompt description(choice, computer_choice, winner)
    prompt messages(winner)

    round += 1
    update_score score_card, winner

    display_score score_card

    break if game_over? score_card
  end

  puts MESSAGES[LANG]['grand_winner'] + " #{grand_winner(score_card)}"
  puts ""

  prompt MESSAGES[LANG]['continue']

  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if correct_answer? answer
    prompt MESSAGES[LANG]['continue_warning']
  end

  break unless continue? answer
end

prompt MESSAGES[LANG]['good_bye']
