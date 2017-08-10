# stack_machine.rb

def perform_operation(value, stack, register)
  case value
  when 'PUSH'   then stack << register[0]
  when 'ADD'    then register[0] += stack.pop
  when 'SUB'    then register[0] -= stack.pop
  when 'MULT'   then register[0] *= stack.pop
  when 'DIV'    then register[0] /= stack.pop
  when 'MOD'    then register[0] %= stack.pop
  when 'POP'    then register[0] = stack.pop
  when 'PRINT'  then puts "#{register[0]}"
  else register[0] = value.to_i
  end
end

def valid?(program = nil)
  return false if program == nil
  valid_values = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  expressions = program.split.reject { |val| val =~ /[0-9]/ }
  expressions.all? { |value| valid_values.include? value }
end

def minilang(program = nil)
  return puts "The given program is not valid." unless valid?(program)
  stack = []
  register = [0]
  program.split.each { |val| perform_operation(val, stack, register) }
end


# => (3 + (4 * 5) - 7) / (5 % 3)
expression = "3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT"
minilang(expression)

minilang()

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)


