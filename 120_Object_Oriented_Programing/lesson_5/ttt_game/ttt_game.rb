require 'yaml'

class Board
  DIRECTIONS = [{x: 0, y: 1}, {x: 1, y: 0}, {x: 1, y: 1}, {x: 1, y: -1}]

  attr_reader :grid, :columns, :rows, :grid_size

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    reset
    @grid_size = grid.size
  end

  def available_squares
    squares = grid.select { |_, square| square.available? }
    squares.map { |_, square| square }
  end

  def full?
    available_squares.empty?
  end

  def has_winner?(player)
    player_squares = grid.select { |_, square| square.marker == player.marker }
    player_squares = player_squares.map { |position, _| position }
    winner?(player_squares)
  end

  def reset
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

  def winner?(grid_selection)
    winner = false
    DIRECTIONS.each do |direction|
      if check_direction(grid_selection, direction)
        winner = true
        break
      end
    end
    winner
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
    (1...3).each do |cur|
      next_x = direction[:x] * cur
      next_y = direction[:y] * cur
      if grid.include? ([x + next_x, y + next_y])
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
  attr_reader :marker, :name

  def initialize(marker, name)
    @marker = marker
    @name = name
  end

  def mark(square)
    square.marker = marker
  end
end

class Human < Player
  def mark(board)
    grid_size = board.grid_size
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
      if (1..board.grid_size).include?(answer) &&
         board.grid[position].available?
        break
      end
      puts "You choose incorrect or unavailable square"
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
    computer_pick = board.available_squares.sample
    super(computer_pick)
  end
end

class TTTGame
  SQUARE_HEIGHT = 3
  BOARD_WIDTH = 3
  BOARD_HEIGHT = 3
  MESSAGES = YAML.load_file('ttt_game_messages.yml')

  attr_accessor :board, :players

  def initialize
    @players = []
  end

  def play
    display_welcome_message
    setup_game
    loop do
      players_move
      display_result
      break unless play_again?
    end
    display_goodbye_message
  end

  private
  def setup_game
    answer = ask_question('start_game', ['play', 'set'])
    if answer == :play
      quick_game
    else
      setup_options
    end
  end

  def quick_game
    @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    players << Human.new('X', "You")
    players << Computer.new('O', "Computer")
  end

  def setup_options
    clear_screen
    puts MESSAGES['en']['configuration']
    player_name = ask_name
    puts ""
    player_symbol = ask_for_symbol
    puts ""
    grid_size = ask_question('grid_size', ['1', '2', '3'])
    puts ""
    initialize_grid(grid_size)
    initialize_players(player_name, player_symbol)
  end

  def initialize_players(name, player_symbol)
    players << Human.new(player_symbol, name)
    players << Computer.new('O', "Computer")
  end

  def initialize_grid(size)
    case size
    when :'1' then width, height = 3, 3
    when :'2' then width, height = 5, 5
    when :'3' then width, height = 9, 9
    end
    @board = Board.new(width, height)

  end

  def play_again?
    answer = ask_question('play_again', ['yes', 'no'])
    board.reset
    return true if answer == :yes
    return false if answer == :no
  end

  def ask_question(question, answers)
    answer = nil
    puts MESSAGES['en'][question]
    loop do
      print "=> "
      answer = gets.chomp.downcase
      break if answers.any? { |choice| choice.start_with? answer }
      puts MESSAGES['en'][question + '_incorrect']
    end
    convert_to_symbol(answer, answers)
  end

  def ask_name
    puts MESSAGES['en']['your_name']
    print "=> "
    gets.chomp
  end

  def ask_for_symbol
    puts MESSAGES['en']['symbols']
    answer = nil
    loop do
      print "=> "
      answer = gets.chomp
      break if answer.size == 1 && answer != 'O'
      puts MESSAGES['en']['symbols_incorrect']
    end
    answer
  end

  def convert_to_symbol(answer, choises)
    value = choises.select { |possibility| possibility.start_with? answer}
    :"#{value[0]}"
  end

  def players_move
    no_of_players = players.size
    loop do
      display(board)
      (0...no_of_players).each do |idx|
        current_player = players[idx]
        current_player.mark(board)
        return if board.has_winner?(current_player) || board.full?
      end
    end
  end

  def display_result
    display(board)
    winner = get_winner
    if !!winner
      puts "#{winner.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def get_winner
    players.each do |player|
      return player if board.has_winner?(player)
    end
    nil
  end

  def clear_screen
    system("cls") || system("clear")
  end

  def display(board)
    clear_screen
    puts ""
    display_players_info
    board.rows.times do |row|
      print_row_separator(row, board.columns)
      print_squares(board.grid, row)
    end
    puts ""
  end

  def display_players_info
    info = ""
    players.each do |player|
      info << player.name
      info << " have "
      info << player.marker
      info << ". "
    end
    puts info
    puts ""
  end

  def print_squares(grid, row)
    row = grid.select { |position, _| position.last == row }
    SQUARE_HEIGHT.times do |idx|
      square_line(row, idx)
    end
  end

  def square_line(row, line_idx)
    puts row.map { |position, square| box_fill(position, square.marker)[line_idx] }.join
  end

  def print_row_separator(row, columns)
    puts "  " + "-----+" * (columns - 1) + "-----" unless row == 0
  end

  def box_fill(position, marker)
    if position.first == 0
      [
        "       ",
        "    #{marker}  ",
        "       "
      ]
    else
      [
        "|     ",
        "|  #{marker}  ",
        "|     "
      ]
    end
  end

  def display_welcome_message
    clear_screen
    puts MESSAGES['en']['welcome']
    puts MESSAGES['en']['rules']
  end

  def display_goodbye_message
    puts MESSAGES['en']['good_bye']
  end
end

game = TTTGame.new
game.play
