# problem_08.rb

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(6)

# => [1, 2]

# => Take takes first number of object as determined by the argument
# => #take returns a new array, and it is not destructive
