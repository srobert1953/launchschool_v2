# minilang.rb

class Minilang
  attr_reader :program

  def initialize(program)
    @program = program.split
    @stack = []
    @register = [0]
  end

  def eval
    while !@program.empty?
      perform_operation(@program.shift)
    end
  end

  def perform_operation(value)
    case value
    when 'PUSH'   then @stack << @register[0]
    when 'ADD'    then @register[0] += @stack.pop
    when 'SUB'    then @register[0] -= @stack.pop
    when 'MULT'   then @register[0] *= @stack.pop
    when 'DIV'    then @register[0] /= @stack.pop
    when 'MOD'    then @register[0] %= @stack.pop
    when 'POP'    then @register[0] = @stack.pop
    when 'PRINT'  then puts "#{@register[0]}"
    else @register[0] = value.to_i
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
