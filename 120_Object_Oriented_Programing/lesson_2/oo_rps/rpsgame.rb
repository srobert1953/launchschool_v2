
class Move
  VALUES = %w(rock paper scissors lizard spock)
  VALUES_ABBREVIATION = %w(r p sc l sp)

  WIN_MOVES = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'spock'],
    'spock' => ['rock', 'scissors']
  }

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def >(other)
    WIN_MOVES[value].include? other.value
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name, :moves_history

  def initialize
    @moves_history = []
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "Please enter your name:"
      n = gets.chomp
      break unless n.empty?
      puts "The name cannot be empty."
    end
    self.name = n
  end

  def choose
    m = move_choice
    m = full_choice_name(m) unless full_name?(m)
    self.move = Move.new(m)
    moves_history << move
  end

  protected

  def correct_move_choice?(move)
    Move::VALUES.include?(move) ||
    Move::VALUES_ABBREVIATION.include?(move)
  end

  def full_name?(name)
    Move::VALUES.include?(name)
  end

  def full_choice_name(name)
    idx = Move::VALUES_ABBREVIATION.find_index(name)
    Move::VALUES[idx]
  end

  private

  def move_choice
  move = nil
  loop do
    puts "Please choose #{Move::VALUES.join(', ')}."
    move = gets.chomp.downcase
    break if correct_move_choice?(move)
    puts "You have mistyped. Please try again."
  end
  move
  end
end

class Computer < Player
  def set_name
    self.name = ['Han Solo', 'Spock', 'Neo', 'Godzilla', 'Gandalf'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
    moves_history << move
  end
end

class Scoreboard
  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @score = { @player1 => 0, @player2 => 0 }
  end

  def display
    width = 42
    puts ""
    puts " SCORE ".center(width, '-')
    puts  "#{player1.name} :#{@score[@player1]}".ljust(width / 2) +
          "#{@score[@player2]}: #{player2.name}".rjust(width / 2)
    puts ""
  end

  def update(winner)
    if player1 == winner
      @score[@player1] += 1
    elsif player2 == winner
      @score[@player2] += 1
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :scoreboard

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scoreboard = Scoreboard.new(human, computer)
    @winner = nil
  end

  def play
    clear_screen
    welcome_message
    loop do
      computer.choose
      human.choose
      display_moves
      set_winner
      display_winner
      update_score
      scoreboard.display
      break unless play_again?
    end
    good_bye_message
  end

  private

  def clear_screen
    system("cls") || system("clear")
  end

  def display_moves
    puts "#{human.name}, you choose #{human.move}"
    puts "#{computer.name} choose #{computer.move}"
  end

  def set_winner
    @winner = if human.move > computer.move
                human
              elsif human.move.value == computer.move.value
                nil
              else
                computer
              end
  end

  def display_winner
    puts ""
    if @winner == human
      puts "#{human.name}, you won!"
    elsif @winner == computer
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if @winner == human
      scoreboard.update human
    elsif @winner == computer
      scoreboard.update computer
    end
  end

  def play_again?
    answer = nil
    puts "Do you want to play again? (y/n)"
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?('y', 'n')
      puts "Please enter yes or no."
    end
    clear_screen
    answer.start_with? 'y'
  end
end

  def welcome_message
    capitalized_moves = Move::VALUES.map(&:capitalize).join(', ')
    puts "#{human.name}, Welcome to #{capitalized_moves} game"
    puts "You are playing against #{computer.name}!"
    puts ""
  end

  def good_bye_message
    puts "Thank you for playing Rock, Paper, Scissors, #{human.name}!"
  end

RPSGame.new.play
