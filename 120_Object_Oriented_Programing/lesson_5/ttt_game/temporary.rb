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
    squares = grid.select { |_, square| square.available? }
		squares.map { |_, square| square }
  end

  def full?
    available_squares.empty?
  end

  def winner
    check_row
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
      # break if someone_won?
      #puts "Computer is choosing"
      #sleep rand(1..2)
      computer.mark(board)
      break if board.full?
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

####################

require 'pry'
hash = {}

(0..5).each do |y|
	(0..5).each do |x|
		hash[[x, y]] = ' '
	end
end

hash[[1, 1]] = 'X'
hash[[2, 2]] = 'O'
hash[[3, 3]] = 'X'
hash[[4, 4]] = 'X'

hash[[2, 1]] = 'X'
hash[[2, 2]] = 'O'
hash[[2, 3]] = 'X'
hash[[2, 4]] = 'X'

hash[[0, 4]] = 'X'
hash[[1, 3]] = 'X'
hash[[2, 2]] = 'O'
hash[[3, 1]] = 'X'

hash[[0, 0]] = 'X'
hash[[1, 0]] = 'O'
hash[[2, 0]] = 'X'
hash[[3, 0]] = 'X'

xs = hash.select { |_, y| y == 'X' }
xs = xs.map { |position, _| position }

DIRECTIONS = [{x: 0, y: 1}, {x: 1, y: 0}, {x: 1, y: 1}, {x: 1, y: -1}]

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
	winning_line = false
	grid_selection.each do |position|
		x = position.first
		y = position.last
		result = winning_direction?(grid_selection, x, y, direction)
		return true if result
	end
	winning_line
end

def winning_direction?(grid, x, y, direction)
	all_positions = false
	(1...4).each do |cur|	
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

p winner?(xs)
