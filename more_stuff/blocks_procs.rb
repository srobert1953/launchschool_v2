# blocks_procs.rb

def take_block(&block)
  block.call
end

take_block { puts "Block in the method" }

def take_another_block number, &block
  block.call number
end

def take_proc_block number, block
  block.call number
end

number = 12
take_another_block(number) { |num| puts "The number is: #{num}"}

my_block = Proc.new do |num|
  puts "Proc number is now: #{num}"
end

take_proc_block(number, my_block)
