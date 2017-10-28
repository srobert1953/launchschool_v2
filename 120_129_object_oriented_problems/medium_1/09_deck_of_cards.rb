class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    create_cards
  end

  def draw
    create_cards if cards.empty?
    cards.pop
  end

  private

  def create_cards
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end

    cards.shuffle!
  end

end

class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    card_weight <=> other.card_weight
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def card_weight
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else
      rank
    end
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
