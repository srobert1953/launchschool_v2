class Game
  def play
    "Start the game"
  end
end

class Bingo < Game
  def rules_of_play
    "Play as best as you can! :P"
  end
end

bingo = Bingo.new
p bingo.play
