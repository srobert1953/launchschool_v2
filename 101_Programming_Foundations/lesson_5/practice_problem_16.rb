# practice_problem_16.rb

# Each UUID consists of 32 hexadecimal characters, and is typically
# broken into 5 sections like this 8-4-4-4-12 and represented as a string.

puts " Launch School Solution ".center(50, '-')

def generate_uuid
  hexadecimal_pool = []
  (0..9).each { |int| hexadecimal_pool << int.to_s}
  ('a'..'f').each { |char| hexadecimal_pool << char}

  sections = [8, 4, 4, 4, 12]
  uuid = ''

  sections.each_with_index do |section, idx|
    section.times { uuid << hexadecimal_pool.sample }
    uuid << '-' unless idx >= sections.size - 1
  end

  uuid
end

p generate_uuid
