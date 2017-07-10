# sort.rb

['arc', 'bat', 'cape', 'ants', 'cap'].sort
# => ['ants', 'arc', 'bat', 'cap', 'cape']

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => [['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]

sorted = ['bathrobe', 'bat', 'batir'].sort_by do |word|
  word[1]
end

p sorted

names = {
  robert: 31,
  alexandra: 27,
  Peter: 24,
  Richard: 3
}

p names.sort_by { |key, value| value }
