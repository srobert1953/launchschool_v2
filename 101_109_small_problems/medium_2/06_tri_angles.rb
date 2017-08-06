# tri_angles.rb

=begin
- input: integer
  - 3 integer values representing triangle angles
- output: symbol
  - :right - one angle is 90 degrees
  - :acute - all 3 angles are less then 90 degrees
  - :obtuse - one angle is greater than 90 degrees
  - :invalid - sum of angles is not 180 degrees, or any angle is 0
- assumptions:
  - only integer value is given
  - all values are in degrees
- edge cases:
  - negative integer is given:
  triangle(-90, 30, 150)  # => :invalid
- test cases:
  triangle(0, 30, 150)  # => :invalid
  triangle(90, 45, 45)  # => :right
  triangle(170, 5, 5)   # => :obtuse
  triangle(91, 90, 5)   # => :invalid
  triangle(91, 45, 44)  # => :obtuse
  triangle(60, 60, 60)  # => :acute
=end

# => define a method #triangle with 3 parameters as 3 angles
# => set an array with 3 values of the angles

# => - return :invalid if
# =>   - first object of the sorted array is less then or equal to 0
# =>   - sum of all values in sorted array is NOT equal to 180

# => - return :right if
# =>   - one angle is 90

# => - return :acute if
# =>   - all 3 angles are less than 90

# => - return :obtuse if
# =>   - one angle is greater than 90

def triangle(a1, a2, a3)
  array_angles = [a1, a2, a3]

  case
  when array_angles.any? { |angle| angle <= 0 },
    array_angles.inject(:+) != 180
    :invalid
  when array_angles.include?(90)
    :right
  when array_angles.all? { |angle| angle < 90 }
    :acute
  when array_angles.any? { |angle| angle > 90 }
    :obtuse
  end
end

p triangle(-90, 150, 30)  == :invalid
p triangle(0, 30, 150)    == :invalid
p triangle(120, 130, 140) == :invalid
p triangle(90, 45, 45)    == :right
p triangle(90, 30, 60)    == :right
p triangle(170, 5, 5)     == :obtuse
p triangle(91, 90, 5)     == :invalid
p triangle(91, 45, 44)    == :obtuse
p triangle(60, 60, 60)    == :acute

p triangle(60, 70, 50)    == :acute
p triangle(30, 90, 60)    == :right
p triangle(120, 50, 10)   == :obtuse
p triangle(0, 90, 90)     == :invalid
p triangle(50, 50, 50)    == :invalid
