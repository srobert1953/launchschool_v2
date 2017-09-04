
class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def >(other)
    if value == 'rock'
      other.value == 'scissors' || other.value == 'lizard'
    elsif value == 'paper'
      other.value == 'rock' || other.value == 'spock'
    elsif value == 'scissors'
      other.value == 'paper' || other.value == 'lizard'
    elsif value == 'lizard'
      other.value == 'paper' || other.value == 'spock'
    elsif value == 'spock'
      other.value == 'rock' || other.value == 'scissors'
    end
  end

  def <(other)
    if value == 'rock'
      other.value == 'paper' || other.value == 'spock'
    elsif value == 'paper'
      other.value == 'scissors' || other.value == 'lizard'
    elsif value == 'scissors'
      other.value == 'rock' || other.value == 'spock'
    elsif value == 'lizard'
      other.value == 'rock' || other.value == 'scissors'
    elsif value == 'spock'
      other.value == 'paper' || other.value == 'lizard'
    end
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    @move = nil
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
    m = nil
    loop do
      puts "Please choose #{Move::VALUES.join(', ')}."
      m = gets.chomp.downcase
      break if Move::VALUES.include?(m)
      puts "You have mistyped. Please try again."
    end
    self.move = Move.new(m)
  end
end

class Computer < Player
  def set_name
    self.name = ['Han Solo', 'Spock', 'Neo', 'Godzilla', 'Gandalf'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
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
    puts "#{player1.name} : #{@score[@player1]}"
    puts "#{player2.name} : #{@score[@player2]}"
  end

  def update(winner)
    if player1.class == winner.class
      @score[@player1] += 1
    elsif player2.class == winner.class
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

  def display_moves
    puts "#{human.name}, you choose #{human.move}"
    puts "#{computer.name} choose #{computer.move}"
  end

  def set_winner
    if human.move > computer.move
      @winner = human
    elsif human.move < computer.move
      @winner = computer
    else
      @winner = nil
    end
  end

  def display_winner
    if @winner == human
      puts "#{human.name}, you won!"
    elsif @winner == computer
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def update_score
    if @winner == human
      scoreboard.update self.human
    elsif @winner == computer
      scoreboard.update self.computer
    end
  end

  def welcome_message
    puts "#{human.name}, Welcome to #{Move::VALUES.map(&:capitalize).join(', ')} game"
    puts "You are playing against #{computer.name}!"
  end

  def good_bye_message
    puts "Thank you for playing Rock, Paper, Scissors, #{human.name}!"
  end

  def play_again?
    answer = nil
    puts "Do you want to play again? (y/n)"
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?('y', 'n')
      puts "Please enter yes or no."
    end
    answer.start_with? 'y'
  end
end

RPSGame.new.play
