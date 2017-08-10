# now_i_know_my_abcs.rb

# =>

BLOCKS = [
  ['B', 'O'],
  ['X', 'K'],
  ['D', 'Q'],
  ['C', 'P'],
  ['N', 'A'],
  ['G', 'T'],
  ['R', 'E'],
  ['F', 'S'],
  ['J', 'W'],
  ['H', 'U'],
  ['V', 'I'],
  ['L', 'Y'],
  ['Z', 'M']
]

def block_word?(word)
  used_blocks = []
  word.upcase.chars.each do |char|
    BLOCKS.each_with_index do |block, idx|
      if block.include? char
        return false if used_blocks.include? idx
        used_blocks << idx
      end
    end
  end
  true
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true

# => Launch School Solution

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  up_word = word.upcase
  BLOCKS.none? { |block| up_word.count(block) >= 2 }
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
