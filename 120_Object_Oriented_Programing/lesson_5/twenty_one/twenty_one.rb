# twenty_one.rb

class Participant
  attr_reader :cards

  def initialize
    @cards = []
  end

  def hit
  end

  def stay
  end

  def total
  end

  def add(card)
    cards.push card
  end

  def show_hand
    hand = ''
    cards.each do |card|
      hand << card.to_s + ', '
    end
    hand
  end
end

class Player < Participant

end

class Dealer < Participant
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
    deal_cards
    show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  private

  def deal_cards
    2.times do
      player.add(deck.deal_card)
      dealer.add(deck.deal_card)
    end
  end

  def show_initial_cards
    puts ""
    puts "You have: #{player.show_hand}"
    puts "Dealer has #{dealer.show_card}"
  end
end

TwentyOne.new.play
