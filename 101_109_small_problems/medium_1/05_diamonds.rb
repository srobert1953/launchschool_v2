# diamonds.rb

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

def print_empty_row(side, center_side)
  row = [' '] * side
  row[center_side] = '*'
  row[-center_side-1] = '*'
  puts row.join
end

def empty_diamond(side)
  side_half = side / 2
  side_half.downto(0) { |idx| print_empty_row(side, idx) }
  1.upto(side_half) { |idx| print_empty_row(side, idx) }
end



empty_diamond 7
empty_diamond 9
empty_diamond 1

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
