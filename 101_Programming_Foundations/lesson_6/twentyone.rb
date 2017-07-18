# twentyone.rb

SPADES    = '♠'
HEARTS    = '♥'
DIAMONDS  = '♦'
CLUBS     = '♣'
ACE       = 'A'
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
  puts "Jack, Queen, and King is value of 10."
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
  "#{card[0]}#{card[1]}"
end

def display_multiple_cards(cards)
  display = ''
  cards.each_with_index do |card, idx|
    display << see_card(card)
    display << ', ' unless cards.size - 1 == idx
    display << 'and ' if cards.size - 2 == idx
  end
  display
end

def display_cards(cards)
  case cards.size
  when 0 then ""
  when 1 then see_card(cards[0])
  when 2 then see_card(cards[0]) + " and " + see_card(cards[1])
  else display_multiple_cards(cards)
  end
end

def show_cards(dealer, player, hidden = true)
  system "clear"
  puts ""
  if hidden
    puts "Dealer has: #{see_card(dealer[0])} and an unknown card"
  else
    puts "Dealer has: #{display_cards(dealer)}"
  end
  puts "You have: #{display_cards(player)}"
end

def cards_values(cards)
  cards.map do |card|
    if card[0].is_a? Integer
      card[0]
    elsif FACE_CARDS.include? card[0]
      10
    elsif card[0] == ACE
      11
    end
  end
end

def cards_value(cards)
  values = cards_values(cards)
  aces, rest = values.partition { |val| val == 11 }
  if aces.empty?
    rest.inject(:+)
  else
    rest_sum = rest.inject(:+)
    aces.size.times { rest_sum > 10 ? rest_sum += 1 : rest_sum += 11 }
    rest_sum
  end
end

def busted?(cards)
  cards_value(cards) > WINNING_VALUE
end

def player_stay?
  answer = nil
  loop do
    puts ""
    prompt "Do you want to '(h)it' or '(s)tay'?"
    answer = gets.chomp.downcase
    possible_answers = ['hit', 'stay']
    break if possible_answers.any? { |ans| ans.start_with? answer }
    prompt "Type (h)it, or enter to get another card, or (s)tay to keep your cards."
  end
  answer.start_with? 's'
end

def dealer_stay?(cards)
  cards_value(cards) >= DEALER_MINIMUM_VALUE
end

def winner(dealer, player)
  dealer_value = cards_value(dealer)
  player_value = cards_value(player)

  return nil if busted?(dealer) &&
                busted?(player)

  if busted?(dealer) ||
     dealer_value < player_value
    'player'
  elsif busted?(player) ||
        player_value < dealer_value
    'dealer'
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
  shuffled_deck = shuffle_deck
  dealer = []
  player = []

  deal_cards(shuffled_deck, player, dealer)

  show_cards(dealer, player)

  loop do
    break if busted?(player) || player_stay?
    player << give_card!(shuffled_deck)
    show_cards(dealer, player)
  end

  if busted?(player)
    show_cards(dealer, player, false)
    puts "You are busted (#{cards_value(player)}), Dealer won (#{cards_value(dealer)})!"
    next if play_again?
    break
  else
    loop do
      break if busted?(dealer) || dealer_stay?(dealer)
      dealer << give_card!(shuffled_deck)
      show_cards(dealer, player, false)
    end
  end

  show_cards(dealer, player, false)
  case winner(dealer, player)
  when 'player'
    puts "You won with cards count of #{cards_value(player)}! Congratulations!"
  when 'dealer'
    puts "Dealer won with cards count of #{cards_value(dealer)}!"
  else
    puts "It's a tie! Dealer: #{cards_value(dealer)}; Player: #{cards_value(player)}"
  end

  break unless play_again?
end

puts ""
puts "Thank you for playing Twenty-One game! Good bye!"
puts ""
