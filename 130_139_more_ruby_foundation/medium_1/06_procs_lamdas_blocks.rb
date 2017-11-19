# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        # => prints Proc object with ID
puts my_proc.class  # => Prints Proc
my_proc.call        # => executes the block
my_proc.call('cat') # => executes the block with given parameter 'cat'

# => Proc can be called directly with .call instance method. It will execute the block
# => which it holds
# => When the Proc is called without any parameter, it executes the block with all block's
# => local variable assigned to nil.
# => When the Proc is called with a parameter, it passes it to the block's local variable

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
# => Lambda is created with a method 'lambda' which belongs to a Kernel class, creating a Proc object
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# => This is second type of creating a Proc object
puts my_lambda
# => returns a Proc object with ID extended with (lambda)
puts my_second_lambda
# => returns a Proc object with ID extended with (lambda)
puts my_lambda.class
# => returns and prints the Proc
my_lambda.call('dog')
# => because lambda creates a Proc object, we can use instance method #call on it.
# => when called with a parameter, the lambda block will assign the given paramter to the local variable

# my_lambda.call
# => when Proc is created using 'lambda' and the block is defined with a parameter, one must be given when calling method #call on a Proc

# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
# => lamda is not a class, so it cannot be created with Lambda.new

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# => When we defined a method with yield, a block must be given. But if the yield is not defined with any argument, then it will not pass anything to the block to assign to block's local variables. So we won't have the #{seal} be printed

# block_method_1('seal')
# => If a method is defined with a yield, block must be given, otherwise we get a LocalJumpError

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# => If yield is defined with arguments, it passes those to the block's definition as local variables, which then can be used
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# => If yield is defined with only one argument, but we want to use two parameters in block's definition, the second parameter will be assigned to nil

# block_method_2('turtle') { puts "This is a #{animal}."}
# => block takes it's local variables from yielded arguments, or from surroundings by binding to the variables or methods. because there is no 'animal' method or a variable, we get an error


