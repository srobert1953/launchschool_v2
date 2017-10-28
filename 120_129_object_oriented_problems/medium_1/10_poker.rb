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

class PokerHand
  def initialize(deck)
    @five_cards = from_deck(deck)
  end

  def print
    five_cards.each do |card|
      puts card
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  # private
  attr_reader :five_cards

  def from_deck(deck)
    if deck.class == Deck
      deck.cards[0, 5]
    else
      deck
    end
  end

  def royal_flush?
    same_suit? && all_royal_ranks?
  end

  def straight_flush?
    same_suit? && straight?
  end

  def four_of_a_kind?
    rank_pairs.select { |pair| pair == 4 }.size == 1
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    same_suit?
  end

  def straight?
    sorted_weights = cards_weight.sort
    counter = sorted_weights.min
    sorted_weights.each do |weight|
      return false unless weight == counter
      counter += 1
    end
    true
  end

  def three_of_a_kind?
    rank_pairs.select { |pair| pair == 3 }.size == 1
  end

  def two_pair?
    rank_pairs.select { |pair| pair == 2 }.size == 2
  end

  def pair?
    rank_pairs.select { |pair| pair == 2 }.size == 1
  end

  def same_suit?
    five_cards.map { |card| card.suit }.uniq.size == 1
  end

  def all_royal_ranks?
    royal_ranks = [10, 'Jack', 'Queen', 'King', 'Ace']
    result = true
    royal_ranks.each do |rank|
      unless five_cards.select { |card| card.rank == rank }.size == 1
        return false
      end
    end
    result
  end

  def rank_pairs
    pairs = Hash.new()
    five_cards.each do |card|
      if pairs[card.rank].nil?
        pairs[card.rank] = [card]
      else
        pairs[card.rank].push card
      end
    end
    pairs.map { |_, cards| cards.size }
  end

  def cards_weight
    five_cards.map { |card| card.card_weight }
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate
puts ''

# Danger danger danger: monkey
# patching for testing purposes.
# class Array
#   alias_method :draw, :pop
# end

hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'


hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'
