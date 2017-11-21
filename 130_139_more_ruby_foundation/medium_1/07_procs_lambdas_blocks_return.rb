# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# => block returns last value of executed command and exit from the method when proc is defined within the method

# Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# => when proc is defined outside of the method, the method return gets called within the proc definition and it throws an error

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# => If lambda is defined within the method, it gets executed when called, but it will not return the value and it will continue the method execution

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# => When lambda is defined outside of method definition, it behaves the same as in Group 3

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# => this behaves as with Group 2
