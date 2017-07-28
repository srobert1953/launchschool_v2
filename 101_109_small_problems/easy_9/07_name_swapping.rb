# name_swapping.rb

def swap_name(name)
  array_name = name.split
  "#{array_name[1]}, #{array_name[0]}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Launch School Solution

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
