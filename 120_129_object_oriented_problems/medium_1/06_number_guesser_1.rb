class GuessingGame
  LIMIT = 7

  def play
    reset_number

    user_number = nil
    LIMIT.downto(1) do |remaining_guesses|
      display_remaining_guesses(remaining_guesses)
      user_number = ask_user_a_number
      evaluate_user_response(user_number)
      break if user_number == guessing_number
    end
    display_loose_message unless user_number == guessing_number
  end

  private

  attr_reader :guessing_number

  def reset_number
    @guessing_number = rand(1..100)
  end

  def ask_user_a_number
    loop do
      print 'Enter a number between 1 and 100: '
      guess = gets.chomp.to_i
      return guess if (1..100).cover? guess
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

game = GuessingGame.new
game.play
