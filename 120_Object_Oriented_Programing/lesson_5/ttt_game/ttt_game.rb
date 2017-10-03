require 'pry'

class Board
  attr_reader :grid, :columns, :rows, :grid_size

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @grid = create_grid(columns, rows)
    @grid_size = grid.size
  end

  def available_squares
    grid.select { |square| square.available? }
  end

  def full?
    available_squares.empty?
  end

  def winner
    check_row
  end

  private

  def check_row
    rows.times do |row|
      row_squares = grid.select do |square|
        square.position.last == row &&
        square.marker != Square::INITIAL_MARKER
      end
      compare_neighbours(row_squares, row) if row_squares.size == 3
    end
  end

  def compare_neighbours(row_squares, row)
    (1...columns - 1).each do |column|
      middle = row_squares.find { |square| square.position == [column, row] }
      left = row_squares.find { |square| square.position == [column - 1, row] }
      right = row_squares.find { |square| square.position == [column + 1, row] }
      if left && right
        p "Printing"
        p middle.has_same_neighbours(left, right)
      end
    end
  end

  def create_grid(x_columns, y_rows)
    grid = []
    (0...y_rows).each do |y|
      (0...x_columns).each do |x|
        grid << Square.new(x, y)
      end
    end
    grid
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  attr_reader :position

  def initialize(x_position, y_position)
    @position = [x_position, y_position]
    @marker = INITIAL_MARKER
  end

  def available?
    marker == INITIAL_MARKER
  end

  def ==(other)
    marker == other.marker
  end

  def has_same_neighbours(other1, other2)
    marker == other1.marker && marker == other2.marker
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
    grid = board.grid
    display_mark_message(grid_size)
    grid_number = get_mark_answer(grid)
    super(grid[grid_number])
  end

  private
  def display_mark_message(grid_size)
    puts "Please choose available square (1-#{grid_size}):"
  end

  def get_mark_answer(grid)
    answer = nil
    loop do
      answer = gets.chomp.to_i
      if (1..grid.size).include?(answer) &&
         grid[answer - 1].available?
        break
      end
      puts "You choose incorrect or unavailable square"
    end
    answer - 1
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

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new(BOARD_WIDTH, BOARD_HEIGHT)
    @human = Human.new('X')
    @computer = Computer.new('O')
  end

  def play
    display_welcome_message
    loop do
      system "clear"
      display(board)
      human.mark(board)
      break if board.full?
      board.winner
      # break if someone_won?
      puts "Computer is choosing"
      sleep rand(1..2)
      computer.mark(board)
      board.winner
      break if board.full?
      # p computer.my_squares
      # break if board.full?
      # break if someone_won?
    end
    display(board)
    # display_result
    display_goodbye_message
  end

  private

  def display(board)
    puts ""
    board.rows.times do |row|
      print_row_separator(row, board.columns)
      print_squares(board.grid, row)
    end
    puts ""
  end

  def print_squares(grid, row)
    row_squares = grid.select { |square| square.position.last == row }
    SQUARE_HEIGHT.times do |idx|
      square_line(row_squares, idx)
    end
  end

  def square_line(row, line_idx)
    puts row.map { |square| box_fill(square, square.marker)[line_idx] }.join
  end

  def print_row_separator(row, columns)
    puts "-----+" * (columns - 1) + "-----" unless row == 0
  end

  def box_fill(square, marker)
    if square.position.first == 0
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
