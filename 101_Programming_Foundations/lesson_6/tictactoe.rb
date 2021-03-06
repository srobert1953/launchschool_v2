# tictactoe.rb

EMPTY_SPACE = ' '
USER_SELECTION = 'X'
COMPUTER_SELECTION = 'O'
GRAND_WINS = 5

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

GRID_WIDTH = 17

def prompt(msg)
  puts "=> #{msg}"
end

def welcome_message
  system 'clear'
  prompt "Welcome to game Tic Tac Toe."
  prompt "You win when you place 3 'X's in any row, column, or diagonal."
  prompt "To start the game, choose first player: player, computer"
  prompt "Whoever wins goes first next until a tie. Then choose first player."
  prompt "Try to win 5 times to become a grand winner"
  prompt "Press enter to continue"
  gets
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initiate_board
  new_board = {}
  (1..9).each { |num| new_board[num] = EMPTY_SPACE }
  new_board
end

def available_choice(brd)
  brd.keys.select { |num| brd[num] == EMPTY_SPACE }
end

def joinor(brd, separator = ',', connector = 'or')
  choises = available_choice(brd)
  case choises.size
  when 0 then ''
  when 1 then choises.first
  when 2 then choises.join(" #{connector} ")
  else
    choises[-1] = "#{connector} #{choises.last}"
    choises.join("#{separator} ")
  end
end

def user_places_piece!(brd)
  selection = ''
  loop do
    prompt "Please select (#{joinor(brd)})"
    selection = gets.chomp.to_i
    break if available_choice(brd).include? selection
    puts "Your selection is invalid."
  end

  brd[selection] = USER_SELECTION
end

def win_places(brd, winning, losing)
  winning_places = WINNING_LINES.map do |line|
    danger = line.reject do |position|
      brd[position] == winning
    end
    danger.size == 1 ? danger : nil
  end
  winning_places.reject { |pos| pos.nil? || brd[pos[0]] == losing }
end

def strategic_positions(brd)
  defend_places = win_places(brd, USER_SELECTION, COMPUTER_SELECTION).flatten
  winning_places = win_places(brd, COMPUTER_SELECTION, USER_SELECTION).flatten
  [defend_places, winning_places]
end

def defensive_play(brd, places)
  case places.count
  when 0
    if brd[5] == EMPTY_SPACE
      brd[5] = COMPUTER_SELECTION
    else
      selection = available_choice(brd).sample
      brd[selection] = COMPUTER_SELECTION
    end
  when 1
    brd[places.first] = COMPUTER_SELECTION
  else
    brd[places.sample] = COMPUTER_SELECTION
  end
end

def computer_places_piece!(brd)
  defend_places, winning_places = strategic_positions(brd)

  puts "Computer is making move"
  sleep rand(1..2)

  if winning_places.empty?
    defensive_play(brd, defend_places)
  else
    brd[winning_places.first] = COMPUTER_SELECTION
  end
end

def board_full?(brd)
  available_choice(brd).empty?
end

def someone_won?(brd)
  !!winner(brd)
end

def winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |val| brd[val] == USER_SELECTION }
      return :player
    elsif line.all? { |val| brd[val] == COMPUTER_SELECTION }
      return :computer
    end
  end
  nil
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again?"
    answer = gets.chomp.downcase
    acceptable_answers = ["yes", "no"]
    next if answer == ""
    break if acceptable_answers.any? { |opt| opt.start_with? answer }
    prompt "Is it 'yes', or 'no'?"
  end
  answer.start_with? 'y'
end

def display_score(score)
  puts "Score".center(GRID_WIDTH)
  puts "Player:   #{score[:player]}"
  puts "Computer: #{score[:computer]}"
  puts ""
end

def grand_winner?(score)
  score.any? { |_, value| value == GRAND_WINS }
end

def display_grand_winner(score)
  winner = score.select { |_, value| value == GRAND_WINS }
  puts "#{winner.keys[0].capitalize} has won #{GRAND_WINS} times! And is a grand winner!"
end

def reset_score!(score)
  score[:player] = 0
  score[:computer] = 0
end

def update_score!(brd, score)
  winner = winner(brd)
  if winner == :player
    score[:player] += 1
  elsif winner == :computer
    score[:computer] += 1
  end
end

def place_piece!(brd, current)
  if current == :computer
    computer_places_piece!(brd)
  elsif current == :player
    user_places_piece!(brd)
  end
end

def choose_first_player
  player = ''
  system "clear"
  loop do
    prompt "Who goes first? (player, computer)"
    player = gets.chomp.downcase
    acceptable_answers = ['player', 'computer']
    break if acceptable_answers.any? { |choice| choice == player }
    prompt "Type 'player' so you go first, or 'computer'"
  end
  :"#{player}"
end

def choose_player(choice)
  case choice
  when :choose then choose_first_player
  when :player then :player
  when :computer then :computer
  end
end

def alternate_player(player)
  player == :player ? :computer : :player
end

score = {
  player: 0,
  computer: 0
}

game_count = 0
first_player = :choose

loop do
  welcome_message if game_count == 0
  goes_first = choose_player(first_player)
  board = initiate_board

  loop do
    display_board(board)
    display_score(score)

    place_piece!(board, goes_first)
    goes_first = alternate_player(goes_first)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)
  if someone_won?(board)
    update_score!(board, score)
    prompt "#{winner(board).capitalize} won!"
    first_player = winner(board)
  else
    prompt "It's a tie"
    first_player = :choose
  end

  display_score(score)
  display_grand_winner(score) if grand_winner?(score)
  reset_score!(score) if grand_winner?(score)
  game_count += 1
  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe. Good bye!"
