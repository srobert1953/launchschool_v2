class GuessingGame

  def initialize(low_limit, high_limit)
    @guessing_number = nil
    @range = (low_limit..high_limit)
  end


  def play
    reset_number

    user_number = nil
    limit.downto(1) do |remaining_guesses|
      display_remaining_guesses(remaining_guesses)
      user_number = ask_user_a_number
      evaluate_user_response(user_number)
      break if user_number == guessing_number
    end
    display_loose_message unless user_number == guessing_number
  end

  private

  attr_reader :guessing_number, :range

  def reset_number
    @guessing_number = rand(range)
  end

  def limit
    min, max = range.first, range.last
    Math.log2(max - min + 1).to_i + 1
  end

  def ask_user_a_number
    loop do
      print "Enter a number between #{range.first} and #{range.last}: "
      guess = gets.chomp.to_i
      return guess if range.cover? guess
      print 'Invalid guess. '
    end
  end

  def evaluate_user_response(number)
    if number == guessing_number
      puts 'You win!'
    elsif number < guessing_number
      puts 'Your guess is too low.'
    else
      puts 'Your guess is too high'
    end
    puts ''
  end

  def display_loose_message
    puts 'You are out of guesses. You lose.'
  end

  def display_remaining_guesses(guess)
    if guess == 1
      puts "You have 1 guess remaining."
    else
      puts "You have #{guess} guesses remaining."
    end
  end
end

game = GuessingGame.new(501, 1500)
game.play
