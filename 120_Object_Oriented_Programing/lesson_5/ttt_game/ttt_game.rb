# ttt_game.rb

class Board
  DIRECTIONS = [{ x: 0, y: 1 },
                { x: 1, y: 0 },
                { x: 1, y: 1 },
                { x: 1, y: -1 }].freeze

  attr_accessor :subsequences
  attr_reader :grid, :columns, :rows

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    reset_grid
    @subsequences = 3
  end

  def available_squares
    squares = grid.select { |_, square| square.available? }
    squares.map { |_, square| square }
  end

  def full?
    available_squares.empty?
  end

  def winner?(player)
    player_squares = grid.select { |_, square| square.marker == player.marker }
    player_squares = player_squares.map { |position, _| position }
    winning_squares?(player_squares)
  end

  def reset_grid
    @grid = create_grid(columns, rows)
  end

  private

  def create_grid(x_columns, y_rows)
    grid = {}
    (0...y_rows).each do |y|
      (0...x_columns).each do |x|
        grid[[x, y]] = Square.new
      end
    end
    grid
  end

  def winning_squares?(grid_selection)
    winning_squares = false
    DIRECTIONS.each do |direction|
      if check_direction(grid_selection, direction)
        winning_squares = true
        break
      end
    end
    winning_squares
  end

  def check_direction(grid_selection, direction)
    grid_selection.each do |position|
      x = position.first
      y = position.last
      return true if winning_direction?(grid_selection, x, y, direction)
    end
    false
  end

  def winning_direction?(grid, x, y, direction)
    all_positions = false
    (1...subsequences).each do |cur|
      next_x = direction[:x] * cur
      next_y = direction[:y] * cur
      if grid.include?([x + next_x, y + next_y])
        all_positions = true
      else
        all_positions = false
        break
      end
    end
    return true if all_positions == true
    false
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def available?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def mark(square)
    square.marker = marker
  end

  def update_score
    @score += 1
  end
end

class Human < Player
  def mark(board)
    grid_size = board.grid.size
    display_mark_message(grid_size)
    square_position = get_mark_answer(board)
    super(board.grid[square_position])
  end

  private

  def display_mark_message(grid_size)
    puts "Please choose available square (1-#{grid_size}):"
  end

  def get_mark_answer(board)
    position = nil
    loop do
      answer = gets.chomp.to_i
      position = identify_position(board, answer)
      if (1..board.grid.size).cover?(answer) &&
         board.grid[position].available?
        break
      end
      puts 'You choose incorrect or unavailable square'
    end
    position
  end

  def identify_position(board, numeric_position)
    counter = 1
    (0...board.columns).each do |y|
      (0...board.rows).each do |x|
        if counter == numeric_position
          return [x, y]
        end
        counter += 1
      end
    end
    false
  end
end

class Computer < Player
  def mark(board)
    computer_pick = choose_square(board)
    super(computer_pick)
  end

  def choose_square(board)
    if middle_square(board).available?
      middle_square(board)
    elsif player_will_win?(board)
      block_square(board)
    else
      board.available_squares.sample
    end
  end

  def middle_square(board)
    middle_x = board.columns / 2
    middle_y = board.rows / 2
    board.grid[[middle_x, middle_y]]
  end

  def player_will_win?(board)
    grid = board.grid
    player_squares = identify_player_squares(grid)
    winning_possition = if check_columns(board, player_squares)
      check_columns(board, player_squares)
    # when { x: 1, y: 0 } then check_rows
    # when { x: 1, y: 1 } then check_left_diagonal
    # when { x: 1, y: -1 } then check_right_diagonal
    end
    p winning_possition
  end

  def check_columns(board, squares)
    board.columns.times do |column|
      counter = 0
      winning_square = nil
      board.rows.times do |row|
        if squares.include? [column, row] &&
           board.grid[[column, row]].marker != marker
          counter += 1
        else
          winning_square = [column, row]
        end
      end
      return winning_square if counter == board.subsequences - 1
    end
    nil
  end

  def identify_player_squares(grid)
    grid.select do |_, square|
      square.marker != self.marker &&
      square.marker != Square::INITIAL_MARKER
    end
  end

  def block_square(board)
    board.available_squares.sample
  end
end

class TTTGame
  MARGIN = 2

  attr_reader :board, :players

  def initialize
    @players = []
  end

  def play
    welcome_screen
    loop do
      players_move
      display_result
      break unless play_again?
    end
    goodbye_screen
  end

  private

  def welcome_screen
    clear_screen
    puts "Welcome to Tic Tac Toe game."
    game_type = ask_question('Quick game type (play)', ['play', 'set'])
    setup_screen(game_type)
  end

  def goodbye_screen
    puts ''
    puts 'Thank you for playing Tic Tac Toe!'
  end

  def setup_screen(game_type)
    if quick_play?(game_type)
      initialize_quick_game
    # else
    #   setup_game
    end
  end

  def quick_play?(game_type)
    game_type == :play
  end

  def play_again?
    answer = ask_question('Play again?', ['yes', 'no'])
    board.reset_grid
    answer == :yes
  end

  def players_move
    no_of_players = players.size
    loop do
      game_screen
      (0...no_of_players).each do |idx|
        current_player = players[idx]
        current_player.mark(board)
        current_player.update_score if board.winner?(current_player)
        return if board.winner?(current_player) || board.full?
      end
    end
  end

  def display_result
    game_screen
    winner_player = winner
    if !!winner_player
      puts "#{winner_player.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def winner
    players.each do |player|
      return player if board.winner?(player)
    end
    nil
  end

  def ask_question(question, answers)
    user_answer = nil
    puts question
    loop do
      print "=> "
      user_answer = gets.chomp.downcase
      break if answers.any? { |choice| choice.start_with? user_answer }
      puts "Please choose one of the following: #{answers.join(', ')}"
    end
    convert_to_symbol(user_answer, answers)
  end

  def convert_to_symbol(answer, choises)
    value = choises.select { |possibility| possibility.start_with? answer }
    :"#{value[0]}"
  end

  def initialize_quick_game
    @board = Board.new(3, 3)
    configure_quick_game_players
  end

  def configure_quick_game_players
    players.push Human.new('Robert', 'X')
    players.push Computer.new('Computer', 'O')
  end

  def game_screen
    clear_screen
    display_score
    display_grid
  end

  def clear_screen
    system('cls') || system('clear')
  end

  def display_score
    name_size = longest_name_size
    score_size = longest_score_size

    puts ''
    puts ' ' * MARGIN + 'Score'.center(name_size + score_size)
    players.each do |player|
      puts display_player_info(player, name_size, score_size)
    end
  end

  def longest_name_size
    player_with_long_name = players.max { |player| player.name.size }
    player_with_long_name.name.size + 4 # 4 is for marker size with ()
  end

  def longest_score_size
    player_with_long_score = players.max { |player| player.score.to_s.size }
    player_with_long_score.score.to_s.size + 2
  end

  def display_player_info(player, name_size, score_size)
    ' ' * MARGIN +
      "#{player.name} (#{player.marker})".ljust(name_size, '.') +
      ": #{player.score}".rjust(score_size)
  end

  def display_grid
    puts ''
    board.rows.times do |row|
      board_row_separator(row, board.columns)
      print_squares(board.grid, row)
    end
    puts ''
  end

  def board_row_separator(row, columns)
    puts ' ' * MARGIN + '-----+' * (columns - 1) + '-----' unless row.zero?
  end

  def print_squares(grid, row)
    row = grid.select { |position, _| position.last == row }
    3.times do |idx|
      square_line(row, idx)
    end
  end

  def square_line(row, line_idx)
    line = row.map do |position, square|
      box_fill(position, square.marker)[line_idx]
    end
    puts line.join
  end

  def box_fill(position, marker)
    if position.first.zero?
      [
        ' ' * MARGIN + '     ',
        ' ' * MARGIN + "  #{marker}  ",
        ' ' * MARGIN + '     '
      ]
    else
      [
        '|     ',
        "|  #{marker}  ",
        '|     '
      ]
    end
  end
end

ttt_game = TTTGame.new
ttt_game.play
