# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# what is != and where should you use it?
# => != : is not equal. Use o]it when a condition should evaluate to opposite of a expected boolean

# put ! before something, like !user_name
# => it means false. Everything evaluates to true, expect false and nil.
# => ! returns false for almost everything, and true for false and nil
# => in this case, !user_name may return an error, if the method or a variable is not declared

# put ! after something, like words.uniq!
# => when ! put after a method call, we assume that the method is a mutable method,
# => and the object called upon will change
# => but this doesn't need to be true

# put ? before something
# => an error, we don;t put ? before anything

# put ? after something
# => when an method is declared with ? we assume it returns a boolean value
# => but this doesn't need to be true

# put !! before something, like !!user_name
# => !! returns true, except when places before false, or nil, then false is returned
