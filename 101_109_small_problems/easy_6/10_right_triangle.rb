# right_triangle.rb

def triangle(side)
  (1..side).each do |size|
    puts ("*" * size).rjust(side, ' ')
  end
end
