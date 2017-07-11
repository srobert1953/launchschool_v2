# practice_problem_08.rb

# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |val|
  val.each do |str|
    str.chars.each do |char|
      puts char if ('aeiou').include? char.downcase
    end
  end
end
