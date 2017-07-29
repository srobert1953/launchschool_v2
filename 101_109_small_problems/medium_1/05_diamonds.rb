# diamonds.rb
require 'pry'

def print_row(side, center_side)
  number_stars = side - (2 * center_side)
  stars = '*' * number_stars
  puts stars.center(side)
end

def diamond(side)
  side_half = side / 2
  side_half.downto(0) { |idx| print_row(side, idx) }
  1.upto(side_half) { |idx| print_row(side, idx) }
end

diamond(1)
diamond(9)
diamond(7)
diamond(0)
diamond(13)

# print_row(9, 4)
# print_row(9, 3)
# print_row(9, 2)
# print_row 9, 1
# print_row 9, 0
# print_row 9, 1
# print_row 9, 2
# print_row 9, 3
# print_row 9, 4
# ----*----
# ---***---
# --*****--
# -*******-
# *********
# -*******-
