# twentyone.rb

require 'pry'

SPADES    = '♠'
HEARTS    = '♥'
DIAMONDS  = '♦'
CLUBS     = '♣'
ACE       = 'A'
ACES      = [1, 11]
SUITS = [SPADES, HEARTS, DIAMONDS, CLUBS]
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", ACE]
FACE_CARDS = ["Jack", "Queen", "King"]
DECK_SIZE = 52
WINNING_VALUE = 21
DEALER_MINIMUM_VALUE = 17

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  system 'clear'
  puts ""
  puts "Welcome to Twenty-One game."
  puts "Try to get as close to 21 as possible, without going over."
  puts "If you go over 21, it's a 'bust' and you lose."
  puts ""
  puts "Card values:"
  puts "Jack, Queen, and King has value of 10."
  puts "Ace can be 1 or 11, to get you closer to 21"
  puts ""
  prompt "Press enter to continue"
  gets
end

def shuffle_deck
  deck = VALUES.product SUITS
  deck.shuffle
end

def give_card!(deck)
  deck.pop
end

def deal_cards(deck, player, dealer)
  2.times do
    player << give_card!(deck)
    dealer << give_card!(deck)
  end
end

def see_card(card)
  "[#{card[0]} #{card[1]}]"
end

def display_cards(cards, separator = ',', connector = 'and')
  case cards.size
  when 0 then ""
  when 1 then see_card(cards[0])
  when 2 then see_card(cards[0]) + " #{connector} " + see_card(cards[1])
  else
    active_cards = cards.map { |card| see_card card }
    active_cards[-1] = "#{connector} #{active_cards.last}"
    active_cards.join("#{separator} ")
  end
end

def show_dealer_hand_with_unkown(cards)
  puts "Dealer has: #{see_card(cards[0])} and an unknown card"
end

def show_dealer_hand_all(cards)
  puts "Dealer has: #{display_cards(cards)}"
end

def show_player_hand(cards)
  puts "You have: #{display_cards(cards)}"
end

def show_cards(dealer, player)
  system "clear"
  puts ""
  show_dealer_hand_with_unkown(dealer)
  show_player_hand(player)
end

def show_unkown_cards(dealer, player)
  system "clear"
  puts ""
  show_dealer_hand_all(dealer)
  show_player_hand(player)
end

def cards_values(cards)
  cards.map do |card|
    if card[0].is_a? Integer
      card[0]
    elsif FACE_CARDS.include? card[0]
      10
    elsif card[0] == ACE
      ACES[1]
    end
  end
end

def cards_sum(cards)
  values = cards_values(cards)
  sum = values.inject(:+)

  values.select { |val| val == ACES[1] }.size.times do
    sum -= 10 if sum > WINNING_VALUE
  end

  sum
end

def busted?(cards_sum)
  cards_sum > WINNING_VALUE
end

def player_stay?
  answer = nil
  loop do
    puts ""
    prompt "Do you want to '(h)it' or '(s)tay'?"
    answer = gets.chomp.downcase
    possible_answers = ['hit', 'stay']
    break if possible_answers.any? { |ans| ans.start_with? answer }
    prompt "Type (h)it, or enter to get another card,",
           "or (s)tay to keep your cards."
  end
  answer.start_with? 's'
end

def dealer_stay?(cards_sum)
  cards_sum >= DEALER_MINIMUM_VALUE
end

def winner(dealer_value, player_value)
  if busted?(player_value)
    :player_busted
  elsif busted?(dealer_value)
    :dealer_busted
  elsif player_value > dealer_value
    :player
  elsif dealer_value > player_value
    :dealer
  else
    :tie
  end
end

def display_winner(dealer_value, player_value)
  case winner(dealer_value, player_value)
  when :player_busted
    puts "You busted (#{player_value})!",
         "Dealer won (#{dealer_value})!"
  when :dealer_busted
    puts "Dealer busted (#{dealer_value})!",
         "You won (#{player_value})!"
  when :player
    puts "You won (#{player_value})! Congratulations!"
  when :dealer
    puts "Dealer won (#{dealer_value})!"
  when :tie
    puts "It's a tie! Dealer: #{dealer_value};",
         "Player: #{player_value}"
  end
end

def play_again?
  answer = ''
  loop do
    puts ""
    prompt "Do you want to play again?"
    answer = gets.chomp.downcase
    acceptable_answers = ["yes", "no"]
    next if answer == ""
    break if acceptable_answers.any? { |opt| opt.start_with? answer }
    prompt "Is it 'yes', or 'no'?"
  end
  answer.start_with? 'y'
end

welcome

loop do # main loop
  deck = shuffle_deck
  dealer = []
  player = []

  deal_cards(deck, player, dealer)
  show_cards(dealer, player)

  loop do
    player_value = cards_sum(player)
    break if busted?(player_value) || player_stay?
    player << give_card!(deck)
    show_cards(dealer, player)
  end

  player_value = cards_sum(player)
  dealer_value = cards_sum(dealer)

  if busted?(player_value)
    show_unkown_cards(dealer, player)
    display_winner(dealer_value, player_value)
    play_again? ? next : break
  else
    loop do
      dealer_value = cards_sum(dealer)
      break if busted?(dealer_value) || dealer_stay?(dealer_value)
      dealer << give_card!(deck)
      show_unkown_cards(dealer, player)
    end
  end

  show_unkown_cards(dealer, player)
  display_winner(dealer_value, player_value)

  break unless play_again?
end

puts ""
puts "Thank you for playing Twenty-One game! Good bye!"
puts ""
