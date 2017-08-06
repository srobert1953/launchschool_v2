# bubble_sort.rb

=begin
- input: an array
- output: an array
  - the same array of sorted objects as given
- assumptions:
  - at least 2 elements are in the array
=end

# => define a method #bubble_sort! whit one parameter
# => We need to iterate over the array so many times until there is no swap
# => We will need some placeholder for the swap count
# => Swap happens when comparable #<=> returns 1
# => Swap does not happen when 0 or -1 is returned

# => SET swap_count to 0
# => iterate over the array
# => with each iteration:
# =>   - compare objects at current index and current index + 1
# =>   - if comparable returns 1, swap objects at indexes
# =>     - increment swap_count by 1
# => break out of the loop if the swap count equals 0

def bubble_sort!(array)
  loop do
    swap_count = 0
    array.size.times do |idx|
      if (array[idx] <=> array[idx+1]) == 1
        array[idx], array[idx+1] = array[idx+1], array[idx]
        swap_count += 1
      end
    end
    break if swap_count == 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
