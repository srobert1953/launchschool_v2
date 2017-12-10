class BeerSong
  BOTTLES_NUMBER = 99
  TWO_BOTTLES = "2 bottles of beer on the wall, 2 bottles of beer.\n" +
                "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  ONE_BOTTLE = "1 bottle of beer on the wall, 1 bottle of beer.\n" +
               "Take it down and pass it around, no more bottles of beer on the wall.\n"
  NO_BOTTLE = "No more bottles of beer on the wall, no more bottles of beer.\n" +
              "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def initialize
    @verses = generate_verses
  end

  def generate_verses
    result = [NO_BOTTLE, ONE_BOTTLE, TWO_BOTTLES]
    (3).upto(BOTTLES_NUMBER) do |vers|
      result << bottles(vers)
    end
    result
  end

  def bottles(vers)
    "#{vers} bottles of beer on the wall, #{vers} bottles of beer.\n" +
    "Take one down and pass it around, #{(vers - 1)} bottles of beer on the wall.\n"
  end

  def lyrics
    verses(99, 0)
  end

  def verse(idx)
    @verses[idx]
  end

  def verses(*idx)
    @verses.reverse[(BOTTLES_NUMBER - idx.first)..(BOTTLES_NUMBER - idx.last)].join("\n")
  end
end
