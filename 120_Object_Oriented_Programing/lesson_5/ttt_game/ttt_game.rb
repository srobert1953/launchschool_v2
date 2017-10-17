# ttt_game.rb
require 'yaml'

class Board
  DIRECTIONS = [{ x: 0, y: 1 },
                { x: 1, y: 0 },
                { x: 1, y: 1 },
                { x: 1, y: -1 }].freeze

  attr_accessor :subsequences
  attr_reader :grid, :columns, :rows

  def initialize(size)
    @columns = size
    @rows = size
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

  def active_markers
    marekrs = grid.select do |_, square|
      square.marker != Square::INITIAL_MARKER
    end
    markers = marekrs.map { |_, square| square.marker }
    markers.uniq
  end

  private

  def create_grid(x_columns, y_rows)
    grid = {}
    counter = 1
    (0...y_rows).each do |y|
      (0...x_columns).each do |x|
        grid[[x, y]] = Square.new(counter)
        counter += 1
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
    all_positions
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  attr_reader :position

  def initialize(position)
    @marker = INITIAL_MARKER
    @position = position
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
    display_mark_message(board)
    square_position = get_mark_answer(board)
    super(board.grid[square_position])
  end

  private

  def display_mark_message(board)
    if name == 'You'
      puts "Please choose available square"
    else
      puts "#{name}, Please choose available square"
    end
    puts "(#{available_squares(board)})"
  end

  def available_squares(board)
    squares = board.available_squares
    squares.map!(&:position)
    join_or(squares)
  end

  def join_or(squares)
    squares[-1] = "or #{squares.last}" if squares.size > 1
    squares.join(', ')
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

  private

  def choose_square(board)
    player_marker = identify_player_marker(board)
    if middle_square(board).available?
      middle_square(board)
    elsif computer_will_win?(board, player_marker)
      block_square(board, player_marker)
    elsif player_will_win?(board)
      block_square(board)
    else
      board.available_squares.sample
    end
  end

  def identify_player_marker(board)
    marker = board.active_markers.reject { |m| m == marker }
    marker.first
  end

  def middle_square(board)
    middle_x = board.columns / 2
    middle_y = board.rows / 2
    board.grid[[middle_x, middle_y]]
  end

  def player_will_win?(board)
    player_squares = identify_possible_win_squares(board)
    !player_squares.empty?
  end

  def computer_will_win?(board, player_marker)
    computer_squares = identify_possible_win_squares(board, player_marker)
    !computer_squares.empty?
  end

  def identify_possible_win_squares(board, for_marker = marker)
    subsequences_size = board.subsequences
    all_possible_moves = all_subsequences(directions(board), subsequences_size)
    all_possible_moves.select do |subsequence|
      subsequence_can_win?(subsequence, for_marker)
    end
  end

  def subsequence_can_win?(squares_array, for_marker)
    squares = squares_array.select do |square|
      return false if square.marker == for_marker
      square.marker == Square::INITIAL_MARKER
    end
    squares.count == 1
  end

  def all_subsequences(directions, subsequences_size)
    subsequences_from_directions = []
    directions.each do |direction|
      (direction.size - subsequences_size + 1).times do |separator|
        subsequences_from_directions << direction[separator, subsequences_size]
      end
    end
    p subsequences_from_directions.count
    subsequences_from_directions
  end

  def directions(board)
    result = []
    result.concat rows(board)
    result.concat columns(board)
    result.concat diagonals(rows(board), board.subsequences)
    result.concat diagonals(columns(board).reverse, board.subsequences)
  end

  def rows(board)
    squares = board.grid
    row = []
    (0...board.columns).each do |y|
      positions = []
      (0...board.rows).each do |x|
        positions << squares[[x, y]]
      end
      row << positions
    end
    row
  end

  def columns(board)
    squares = board.grid
    row = []
    (0...board.rows).each do |x|
      positions = []
      (0...board.columns).each do |y|
        positions << squares[[x, y]]
      end
      row << positions
    end
    row
  end

  def diagonals(rows, subsequences)
    combinations = upper_diagonals(rows) + lower_diagonals(rows)
    combinations.uniq!
    combinations.select { |diagonal| diagonal.size >= subsequences }
  end

  def upper_diagonals(rows)
    upper_offset_rows = offset_rows_left(rows)
    create_upper_diagonals(upper_offset_rows)
  end

  def lower_diagonals(rows)
    lower_offset_rows = offset_rows_right(rows)
    create_lower_diagonals(lower_offset_rows)
  end

  def offset_rows_left(rows)
    position = 0
    offset_rows = []
    rows.each do |row|
      offset_rows << row[position...rows.count]
      position += 1
    end
    offset_rows
  end

  def offset_rows_right(rows)
    position = 0
    offset_rows = []
    rows.each do |row|
      offset_rows << row[0..position]
      position += 1
    end
    offset_rows
  end

  def create_upper_diagonals(upper_offset_rows)
    diagonals = []
    upper_offset_rows.first.size.times do |counter|
      diagonal = []
      upper_offset_rows.each do |row|
        diagonal << row[counter] unless row[counter].nil?
      end
      diagonals << diagonal
    end
    diagonals
  end

  def create_lower_diagonals(lower_offset_rows)
    rows = []

    lower_offset_rows.each do |row|
      rows << row.reverse
    end

    diagonals = []
    rows.last.size.times do |counter|
      diagonal = []
      rows.each do |row|
        diagonal << row[counter] unless row[counter].nil?
      end
      diagonals << diagonal
    end
    diagonals
  end

  def block_square(board, win_marker = marker)
    player_win_rows = identify_possible_win_squares(board, win_marker)
    win_squares = player_win_rows.sample
    win_squares.select! { |square| square.marker == Square::INITIAL_MARKER }
    win_squares.first
  end
end

class TTTGame
  MARGIN = 2
  MESSAGES = YAML.load_file('ttt_game_messages.yml')
  LNG = 'en'
  DEFAULT_BOARD_SIZE = 3

  attr_reader :board, :players

  def initialize
    reset_players
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

  def reset_players
    @players = []
  end

  def welcome_screen
    clear_screen
    puts MESSAGES[LNG]['welcome']
    game_type = ask_question(MESSAGES[LNG]['game_type'], ['play', 'set'])
    setup_screen(game_type)
  end

  def goodbye_screen
    puts ''
    puts MESSAGES[LNG]['good_bye']
  end

  def setup_screen(game_type)
    if quick_play?(game_type)
      initialize_quick_game
    else
      setup_game
    end
  end

  def setup_game
    clear_screen
    puts MESSAGES[LNG]['setup_welcome']
    puts MESSAGES[LNG]['setup_prologue']
    verison_options = ['single', 'multi']
    game_version = ask_question(MESSAGES[LNG]['game_version'], verison_options)
    if game_version == :single
      setup_single_player_game
    else
      setup_multi_player_game
    end
  end

  def setup_single_player_game
    name = ask_name('ask_name')
    puts MESSAGES[LNG]['ask_symbol']
    symbol = ask_symbol
    setup_single_players(name, symbol)
    setup_board
    start_game
  end

  def setup_multi_player_game
    player1_name = ask_name('player_one_name')
    player2_name = ask_name('player_two_name')
    symbol1, symbol2 = player_symbols(player1_name, player2_name)
    setup_multi_players(player1_name, player2_name, symbol1, symbol2)
    setup_board
    start_game
  end

  def player_symbols(name1, name2)
    puts MESSAGES[LNG]['ask_symbol']
    puts "#{name1} symbol:"
    symbol_player1 = ask_symbol
    if symbol_player1.empty?
      symbol_player2 = 'O'
    else
      puts "#{name2} symbol:"
      symbol_player2 = ask_symbol
    end
    [symbol_player1, symbol_player2]
  end

  def setup_single_players(name, symbol)
    symbol = symbol.empty? ? 'X' : symbol
    reset_players
    players << Human.new(name, symbol)
    players << Computer.new('Computer', 'O')
  end

  def setup_multi_players(name1, name2, symbol1, symbol2)
    symbol1 = symbol1.empty? ? 'X' : symbol1
    reset_players
    players << Human.new(name1, symbol1)
    players << Human.new(name2, symbol2)
  end

  def setup_board
    board_sizes = ['3x3', '4x4', '5x5', '6x6', '7x7', '8x8', '9x9']
    size = ask_question(MESSAGES[LNG]['board_size'], board_sizes)
    subsequences = if size == :'3x3'
                     3
                   else
                     ask_subsequences(size)
                   end
    initialize_board(size, subsequences)
  end

  def initialize_board(size, subsequences)
    size = size.to_s[0].to_i
    @board = Board.new(size)
    board.subsequences = subsequences
  end

  def start_game
    puts MESSAGES[LNG]['start_new_game']
    gets
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
      (0...no_of_players).each do |idx|
        display_game_screen
        current_player = players[idx]
        current_player.mark(board)
        current_player.update_score if board.winner?(current_player)
        return nil if board.winner?(current_player) || board.full?
      end
    end
  end

  def display_game_screen
    board.grid.size > 9 ? game_screen(true) : game_screen
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

  def ask_subsequences(size)
    size_integer = size.to_s[0].to_i
    subsequences = nil
    loop do
      puts MESSAGES[LNG]['ask_subsequences']
      prompt
      subsequences = gets.chomp.to_i
      break if subsequences <= size_integer && subsequences >= 3
      puts MESSAGES[LNG]['incorrect_subsequences']
    end
    subsequences
  end

  def ask_symbol
    symbol = nil
    loop do
      prompt
      symbol = gets.chomp
      break if symbol.size <= 1
      puts MESSAGES[LNG]['incorrect_symbol']
    end
    symbol
  end

  def ask_name(game_type)
    name = nil
    loop do
      puts MESSAGES[LNG][game_type]
      prompt
      name = gets.chomp.capitalize
      break unless name.empty?
      puts MESSAGES[LNG]['empty_response']
    end
    name
  end

  def ask_question(question, answers)
    user_answer = nil
    puts question
    loop do
      prompt
      user_answer = gets.chomp.downcase
      if !user_answer.empty? &&
         answers.any? { |choice| choice.start_with? user_answer }
        break
      end
      puts "Please choose one of the following: #{answers.join(', ')}"
    end
    convert_to_symbol(user_answer, answers)
  end

  def prompt
    puts ''
    print "=> "
  end

  def convert_to_symbol(answer, choises)
    value = choises.select { |possibility| possibility.start_with? answer }
    :"#{value[0]}"
  end

  def initialize_quick_game
    @board = Board.new(DEFAULT_BOARD_SIZE)
    configure_quick_game_players
  end

  def configure_quick_game_players
    reset_players
    players.push Human.new('You', 'X')
    players.push Computer.new('Computer', 'O')
  end

  def game_screen(help = false)
    clear_screen
    display_score
    display_grid(help)
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

  def display_grid(help)
    puts ''
    board.rows.times do |row|
      board_row_separator(row, board.columns)
      print_squares(board.grid, row, help)
    end
    puts ''
  end

  def board_row_separator(row, columns)
    puts ' ' * MARGIN + '-----+' * (columns - 1) + '-----' unless row.zero?
  end

  def print_squares(grid, row, help)
    row = grid.select { |position, _| position.last == row }
    3.times do |idx|
      square_line(row, idx, help)
    end
  end

  def square_line(row, line_idx, help)
    line = row.map do |position, square|
      box_fill(position, square, help)[line_idx]
    end
    puts line.join
  end

  def box_fill(position, square, help)
    help_number = help ? square.position : ' '
    if position.first.zero?
      [
        ' ' * MARGIN + helping_number(help_number),
        ' ' * MARGIN + "  #{square.marker}  ",
        ' ' * MARGIN + '     '
      ]
    else
      [
        "|" + helping_number(help_number),
        "|  #{square.marker}  ",
        '|     '
      ]
    end
  end

  def helping_number(help_number)
    " " * (5 - help_number.to_s.size) + help_number.to_s
  end
end

ttt_game = TTTGame.new
ttt_game.play
