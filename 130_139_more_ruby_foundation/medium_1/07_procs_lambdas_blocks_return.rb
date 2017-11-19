# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# => block returns last value of executed command

# Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# => Proc with lambda is not executed

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

block_method_3 { return }
