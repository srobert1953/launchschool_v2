require 'pry'

class Board
  DIRECTIONS = [{x: 0, y: 1}, {x: 1, y: 0}, {x: 1, y: 1}, {x: 1, y: -1}]

  attr_reader :grid, :columns, :rows, :grid_size

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @grid = create_grid(columns, rows)
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
  attr_reader :marker

  def initialize(marker)
    @marker = marker
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
  BOARD_WIDTH = 4
  BOARD_HEIGHT = 4

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    @human = Human.new('X')
    @computer = Computer.new('O')
  end

  def play
    display_welcome_message
    loop do
      display(board)

      human.mark(board)
      break if board.has_winner?(human) || board.full?

      computer.mark(board)
      break if board.has_winner?(computer) || board.full?
    end
    display_result
    display_goodbye_message
  end

  private
  def display_result
    display(board)
    if board.has_winner?(human)
      puts "You have won!"
    elsif board.has_winner?(computer)
      puts "Computer has won!"
    else
      puts "It's a tie!"
    end
  end

  def display(board)
    system "clear"
    puts ""
    board.rows.times do |row|
      print_row_separator(row, board.columns)
      print_squares(board.grid, row)
    end
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
    puts "-----+" * (columns - 1) + "-----" unless row == 0
  end

  def box_fill(position, marker)
    if position.first == 0
      [
        "     ",
        "  #{marker}  ",
        "     "
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
    puts "Welcome to TicTacToe Game!"
  end

  def display_goodbye_message
    puts "Thank you for playing TicTacToe!"
  end
end

game = TTTGame.new
game.play
