# triangle_sides.rb

# => Take 3 sides as integers
# => SET an array of the 3 values
# => sort the array

def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  sides.sort!
  case
  when (sides[0] + sides[1] < sides[2] || sides.include?(0))
    :invalid
  when sides[0] == sides[2]
    :equilateral
  when sides[0] == sides[1] || sides[1] == sides[2]
    :isosceles
  else :scalene
  end
end


p triangle(3, 3, 3)
p triangle(3, 3, 1.5)
p triangle(3, 4, 5)
p triangle(0, 3, 3)
p triangle(3, 1, 1)
