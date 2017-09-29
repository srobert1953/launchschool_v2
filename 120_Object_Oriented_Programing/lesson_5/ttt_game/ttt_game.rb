class Board
  attr_reader :grid, :columns, :rows

  def initialize(columns, rows)
    @columns = columns
    @rows = rows
    @grid = create_grid(columns, rows)
  end

  def display
    puts ""
    rows.times do |row|
      print_row_separator(row)
      print_squares(row)
    end
    puts ""
  end

  private

  def create_grid(x_columns, y_rows)
    grid = []
    (0...y_rows).each do |y|
      (0...x_columns).each do |x|
        grid << Square.new(x, y)
      end
    end
    grid
  end

  def print_squares(row)
    row_squares = grid.select { |square| square.position.last == row }
    square_height = row_squares.first.line.size
    square_height.times do |idx|
      print_square_line(row_squares, idx)
    end
  end

  def print_square_line(row, line_idx)
    puts row.map { |square| square.line[line_idx] }.join
  end

  def print_row_separator(row)
    puts "-----+" * (columns - 1) + "-----" unless row == 0
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_accessor :marker
  attr_reader :position, :line

  def initialize(x_position, y_position)
    @position = [x_position, y_position]
    @marker = INITIAL_MARKER
    @line = set_line_boundary
  end

  private

  def set_line_boundary
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
end

class Player
  def initialize

  end

  def mark

  end

  def play

  end
end

class TTTGame
  def play
    display_welcome_message
    board = Board.new(3, 3)
    loop do
      board.display
      break
      # first_player_moves
      # break if someone_won? || board_full?

      # second_player_moves
      # break if someone_won? || board_full?
    end
    # display_result
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to TicTacToe Game!"
  end

  def display_goodbye_message
    puts "Thank you for playing TicTacToe!"
  end
end

game = TTTGame.new
game.play
