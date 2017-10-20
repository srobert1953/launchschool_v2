# twenty_one.rb

require 'pry'

class Participant
  MAXIMUM_HIT = 21

  attr_reader :cards, :name

  def initialize(name)
    @cards = []
    @name = name
  end

  def total
    total = cards.map do |card|
      value(card)
    end
    total = total.inject(&:+)

    if cards.any?(&:ace?) && # => Adjust for Ace value
       total > MAXIMUM_HIT
      total -= 10
    end

    total
  end

  def clear_hand
    @cards = []
  end

  def add(card)
    cards.push card
  end

  def busted?
    total > MAXIMUM_HIT
  end

  def >(other)
    total > other.total
  end

  def <(other)
    total < other.total
  end

  def show_all_cards
    puts ''
    puts "#{name}'s hand:"
    puts show_hand
    puts ''
  end

  private

  def value(card)
    if card.ace?
      11
    elsif card.king? || card.queen? || card.jack?
      10
    else
      card.face
    end
  end

  def show_hand
    hand = []
    cards.each do |card|
      hand << card.to_s
    end
    format(hand)
  end

  def format(cards_array)
    result = ""
    cards_array.each do |card|
      result << card.to_s + "\n"
    end
    result
  end
end

class Player < Participant

  def initialize
    super(ask_name)
  end

  def ask_name
    response = nil
    loop do
      puts "What is your name?"
      response = gets.chomp.capitalize
      break unless response.empty?
      puts "Please type at least one character."
    end
    response
  end
end

class Dealer < Participant
  MINIMUM_HIT = 17
  NAMES = ['Han Solo', 'Spock', 'Sarah Connor', 'R2-D2']

  def initialize
    super(NAMES.sample)
  end

  def show_one_card
    puts ''
    puts "#{name}'s hand:"
    puts show_card
  end

  private

  def show_card
    cards.first.to_s + "\nUnknown Card"
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
  SUITS = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  attr_reader :suit, :face

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "#{face} of #{suit}"
  end

  def jack?;  face == 'Jack'; end
  def queen?; face == 'Queen'; end
  def king?;  face == 'King'; end
  def ace?;   face == 'Ace'; end
end

class TwentyOne
  attr_reader :deck, :player, :dealer

  def initialize
    @deck = Deck.new
  end

  def play
    welcome_message
    initialize_players
    loop do
      reset_play
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn
      show_result
      break unless play_again?
    end
    good_bye_message
  end

  private

  def initialize_players
    @player = Player.new
    @dealer = Dealer.new
  end

  def clear_screen
    system('cls') || system('clear')
  end

  def welcome_message
    clear_screen
    puts ''
    puts 'Welcome to Twenty One Game!'
    puts ''
    puts 'Get as close to 21 as possible by hitting new cards'
    puts 'Try not to go over 21, or you are busted!'
    puts ''
    puts 'To start, press anything'
    gets
  end

  def good_bye_message
    clear_screen
    puts ''
    puts 'Thank you for playing Twenty One game!'
    puts ''
  end

  def reset_play
    player.clear_hand
    dealer.clear_hand
    deck.shuffle_deck
  end

  def deal_cards
    2.times do
      player.add(deck.deal_card)
      dealer.add(deck.deal_card)
    end
  end

  def show_initial_cards
    clear_screen
    show_players_names
    player.show_all_cards
    puts "Your total is: #{player.total}"
    dealer.show_one_card
  end

  def show_all_cards
    clear_screen
    player.show_all_cards
    puts "Your total: #{player.total}"
    dealer.show_all_cards
    puts "#{dealer.name}'s total: #{dealer.total}"
  end

    def show_players_names
      puts ''
      puts "You are playing against #{dealer.name}"
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
    puts "#{dealer.name} is choosing cards."
    sleep rand(1..2)
    loop do
      if !dealer.busted? &&
         dealer.total < Dealer::MINIMUM_HIT
        dealer.add(deck.deal_card)
      else
        break
      end
    end
    show_all_cards
  end

  def show_result
    dealer_name = dealer.name
    player_name = player.name
    puts ''
    if dealer_won?
      puts "#{dealer_name} won!"
    elsif player_won?
      puts "#{player_name}, you won. Congratulations!"
    elsif player_busted?
      puts "You're busted :( #{dealer_name} won!"
    elsif dealer_busted?
      puts "Dealer's busted :), #{player_name}, you won!"
    else
      puts "It's a tie!"
    end
  end

  def dealer_won?
    !player.busted? && !dealer.busted? && dealer > player
  end

  def player_won?
    !player.busted? && !dealer.busted? && player > dealer
  end

  def dealer_busted?
    dealer.busted? && !player.busted?
  end

  def player_busted?
    player.busted? && !dealer.busted?
  end

  def play_again?
    answer = ask_question('Do you want to play again?', ['yes', 'no'])
    answer == :yes
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
