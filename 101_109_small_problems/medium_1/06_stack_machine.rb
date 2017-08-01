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

def minilang(program)
  stack = []
  register = [0]
  program.split.each { |val| perform_operation(val, stack, register) }
end

# => Not finished...
# def to_minilang_program(expression)
#   array_expression = expression.chars.reject { |v| v == ' '}
#   minilang_expression = []
#   array_expression.each do |val|
#     case val
#     when '+' then minilang_expression.push 'ADD'
#     when '-' then minilang_expression.push 'SUB'
#     when '*' then minilang_expression.push 'MULT'
#     when '/' then minilang_expression.push 'DIV'
#     when '%' then minilang_expression.push 'MOD'
#     when '('
#       minilang_expression.push 'PUSH'
#     when ')' then minilang_expression.push 'POP'
#     else minilang_expression.push val
#     end
#   end
#   minilang_expression.join(' ') << ' PRINT'
# end

# p to_minilang_program("(3 + (4 * 5) - 7) / (5 % 3)")

# minilang()

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)


