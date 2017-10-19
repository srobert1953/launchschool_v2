# twenty_one.rb

require 'pry'

class Participant
  MAXIMUM_HIT = 21

  attr_reader :cards

  def initialize
    @cards = []
  end

  def total
    total = cards.map do |card|
      case card.face
      when (2..9) then card.face
      when 'Ace' then 11
      else
        10
      end
    end
    total = total.inject(&:+)

    if cards.include?('Ace') && # => Adjust for Ace value
       total > MAXIMUM_HIT
      total -= 10
    end

    total
  end

  def add(card)
    cards.push card
  end

  def show_hand
    hand = []
    cards.each do |card|
      hand << card.to_s
    end
    format(hand)
  end

  def busted?
    total > MAXIMUM_HIT
  end

  private

  def format(cards_array)
    result = if cards_array.count == 1
      cards_array.first
    else
      cards_array[-1] = "and #{cards_array.last}"
      cards_array.join(', ')
    end
    result
  end

end

class Player < Participant

end

class Dealer < Participant
  MINIMUM_HIT = 17
  def show_card
    cards.first.to_s
  end
end


class Deck
  attr_reader :cards

  def initialize
    shuffle_deck
  end

  def shuffle_deck
    @cards = new_cards.shuffle
  end

  def deal_card
    cards.pop
  end

  private

  def new_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |face|
        cards.push Card.new(suit, face)
      end
    end
    cards
  end
end

class Card
  SUITS = ['S', 'H', 'D', 'C']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "#{face} of #{suit}"
  end

  def face
    case @face
    when 11 then 'Jack'
    when 12 then 'Queen'
    when 13 then 'King'
    when 14 then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'C' then '♣'
    when 'H' then '♥'
    when 'D' then '♦'
    when 'S' then '♠'
    end
  end
end

class TwentyOne
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def play
    welcome_message
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end

  private

  def clear_screen
    system('cls') || system('clear')
  end

  def welcome_message
    puts ""
    puts "Welcome to Twenty One Game!"
  end

  def deal_cards
    2.times do
      player.add(deck.deal_card)
      dealer.add(deck.deal_card)
    end
  end

  def show_initial_cards
    clear_screen
    puts ""
    puts "You have #{player.show_hand}. Your total: #{player.total}"
    puts "Dealer has #{dealer.show_card}, and an unknown card."
  end

  def show_all_cards
    clear_screen
    puts ''
    puts "You have #{player.show_hand}. Your total: #{player.total}"
    puts "Dealer has #{dealer.show_hand}. Dealer's total: #{dealer.total}"
  end

  def player_turn
    loop do
      hit = ask_question("Do you want to 'hit' or 'stay'?", ['hit', 'stay'])
      if hit == :hit
        player.add(deck.deal_card)
        show_initial_cards
      else
        break
      end
      break if player.busted?
    end
  end

  def dealer_turn
    puts ''
    puts "Dealer is choosing cards."
    loop do
      unless dealer.busted? || dealer.total >= Dealer::MINIMUM_HIT
        dealer.add(deck.deal_card)
      else
        break
      end
    end
    show_all_cards
  end

  def show_result
    puts ''
    if !player.busted? && !dealer.busted? && dealer.total > player.total
      puts "Dealer won!"
    elsif !player.busted? && !dealer.busted? && player.total > dealer.total
      puts "You won. Congratulations!"
    elsif player.busted? && !dealer.busted?
      puts "You're busted :(, Computer won!"
    elsif dealer.busted? && !player.busted?
      puts "Dealer's busted :), You won!"
    else
      puts "It's a tie!"
    end
  end

  def ask_question(question, answers)
    user_answer = nil
    puts ''
    puts question
    loop do
      prompt
      user_answer = gets.chomp.downcase
      if !user_answer.empty? &&
         answers.any? { |choice| choice.start_with? user_answer }
        break
      end
      puts ''
      puts "Please choose one of the following: #{answers.join(', ')}"
    end
    convert_to_symbol(user_answer, answers)
  end

  def prompt
    print "=> "
  end

  def convert_to_symbol(answer, choises)
    value = choises.select { |possibility| possibility.start_with? answer }
    :"#{value.first}"
  end

end

TwentyOne.new.play
