# blocks.rb

# => Mental model for blocks:

# Example 4:

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# => Line 7:
# =>  Action: method call #map
# =>  Object: Outer array
# =>  Side effect: none
# =>  Return value: New array: [1, 3]
# =>  Used return value?: No
# => Line 7-10:
# =>  Action: block execution
# =>  Object: Each sub-array
# =>  Side effect: None
# =>  Return Value: 1 and 3, Each object at index 0 of inner arrays
# =>  Used return value?: Yes, for transformation of #map
# => Line 8:
# =>  Action: method call #first on inner array
# =>  Object: Each Inner array
# =>  Side effect: none
# =>  Return value: Object at index 0 of inner arrays
# =>  Used return value? Yes, used by #puts
# => Line 8:
# =>  Action: Method call #puts
# =>  Object: Each Object at index 0 of inner array
# =>  Side effect: prints object as a string representation
# =>  Return value: nil
# =>  Used return value: No
# => Line 9:
# =>  Action: Method call #first
# =>  Object: Each Object at index 0 of inner array
# =>  Side effect: None
# =>  Return value: 1 and 3, Each Objects at index 0 of inner arrays
# =>  Used return value?: Yes, used as a return value of the block, by #map

# Example 5:

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# => Line 45:
# =>  Action: method call #each
# =>  Object: Outer array
# =>  Side effect: None
# =>  Return value: Original array: [[18, 7], [3, 12]]
# =>  Used return value?: Yes, assigned to a variable my_arr
# => Line 45-51:
# =>  Action: Block execution
# =>  Object: Each sub array
# =>  Side effect: None
# =>  Return Value: Each sub-array
# =>  Used return value?: No
# => Line 46:
# =>  Action: method call #each
# =>  Object: Each Integer object of sub array
# =>  Side effect: none
# =>  Return value: Each sub-array
# =>  Used return value?: No
# => Line 46-50:
# =>  Action: block execution
# =>  Object: each Integer object of the inner sub-array
# =>  Side effect: None
# =>  Return value: nil
# =>  Used return value?: No
# => Line 47:
# =>  Action: comparison
# =>  Object: Each Integer object of sub array with number 5
# =>  Side effect: None
# =>  Return value: true or false, if the object is greater than 5
# =>  Used return value?: Yes, by if control statement
# => Line 47-49:
# =>  Action: Conditional statement if
# =>  Object: return value of comparison true, or false
# =>  Side effect: none
# =>  Return value: nil
# =>  Used return value: No
# => Line 48:
# =>  Action: Method call #puts
# =>  Object: Integer Object if the comparison is true
# =>  Side effect: prints Integer object as string representation
# =>  Return value: nil
# =>  Used return value?: No

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => Line 96:
# =>  Action: method call #map
# =>  Object: Outer array
# =>  Side effect: none
# =>  Return value: [[2, 4], [6, 8]]
# =>  Used return value?: No
# => Line 96-100:
# =>  Action: block execution
# =>  Object: Each sub-array
# =>  Side effect: none
# =>  Return value: each execution of #map on inner array, [2, 4] and [6, 8]
# =>  Used return value?: Yes, determines transformation of outer #map
# => Line 97:
# =>  Action: method call #map
# =>  Object: Each inner array
# =>  Side effect: None
# =>  Return value: each execution of transformation of inner arrays: [2, 4] and [6, 8]
# =>  Used return value? Yes, determines the return value of outer block
# => Line 97-99:
# =>  Action: block execution
# =>  Object: Each integer of inner arrays
# =>  Side effect: none
# =>  Return value: each integer of inner array doubled: 2, 4, 6, 8
# =>  Used return value?: Yes, determines transformation of inner #map
# => Line 98:
# =>  Action: multiplication by 2
# =>  Object: each integer of inner arrays
# =>  Side effect: none
# =>  Return value: each integer multiplied by two: 2, 4, 6, 8
# =>  Used return value?: Yes, determines block return value

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

# => Line 133:
# =>  Action: method call #select
# =>  Object: array of hashes
# =>  Side effect? None
# =>  Return value: new nested array of hashes: [{:c => 'cat'}]
# =>  Used return value?: No
# => Line 133-137:
# =>  Action: Block execution
# =>  Object: each sub hash
# =>  Side effect: none
# =>  Return value: true or false of selection criteria for each sub hash
# =>  Used return value? Yes, determines selection of #select method
# => Line 134:
# =>  Action: method call #all?
# =>  Object: each sub hash
# =>  Side effect: none
# =>  Return value: true or false for selection criteria of each sub hash
# =>  Used return value?: Yes, determines the return value of outer block
# => Line 134-136:
# =>  Action: block execution
# =>  Object: each sub hash
# =>  Side effect: none
# =>  Return value: true or false for each sub hash
# =>  Used return value?: Yes, determines the return value of inner block used by #all? method
# => Line 135:
# =>  Action: method call #to_s
# =>  Object: key of each inner index
# =>  Side effect: none
# =>  Return value: a string interpretation of symbol of keys in each sub hash
# =>  Used return value?: Yes, used in comparison
# => Line 135:
# =>  Action: comparison
# =>  Object: character at index 0 of value of each sub hash and string interpretation of key symbol
# =>  Side effect: none
# =>  Return value: true or false, if both objects are equal
# =>  Used return value? Yes, determines return value of inner block

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# => Line 176:
# =>  Action: method call #map
# =>  Object: nested array
# =>  Side effect: none
# =>  Return value: [[[2, 3], [4, 5]], [6, 7]]
# =>  Used return value?: No
# => Line 176-186:
# =>  Action: block execution
# =>  Object: Each inner array
# =>  Side effect: none
# =>  Return value: an inner array, or an integer
# =>  Used return value?: Yes, determines the #map return value
# => Line 177:
# =>  Action: method call #map
# =>  Object: each inner array
# =>  Side effect: none
# =>  Return value: each integer object of inner array raised by one
# =>  Used return value?: Yes, determines the return value of outer block
# => Line 177-185:
# =>  Action: block execution
# =>  Object: each inner array
# =>  Side effect: none
# =>  return value: each integer object of inner arrays raised by one
# =>  Used return value?: yes, determines the return value of inner block
# => Line 178:
# =>  Action: method call #to_s
# =>  Object: each inner array object
# =>  Side effect: none
# =>  Return value: string representation of inner array objects
# =>  Used return value?: Yes, used for method call #size
# => Line 178:
# =>  Action: method call #size
# =>  Object: each string representation of inner arrays
# =>  side effect: none
# =>  Return value: an integer representing a count of characters
# =>  Used return value?: Yes, for comparison
# => Line 178-184:
# =>  Action: conditional statement if
# =>  Object: integer representing a count of characters
# =>  Side effect: none
# =>  Return value: integer of each inner array raised by one
# =>  Used return value?: Yes, determines the inner block return value
# => Line 179:
# =>  Action: raising integer of each inner array object by one
# =>  Object: n/a
# =>  Side effect: none
# =>  Return value: integer raised by one
# =>  Used return value?: Yes, determines a return value of if conditional
# => Line 180:
# =>  Conditional else
# => Line 181:
# =>  Action: method call #map
# =>  Object: each nested inner array object
# =>  Side effect: none
# =>  Return value: an integer
# =>  Used return value?: Yes, determines a return value of if conditional
# => Line 181-183:
# =>  Action: block execution
# =>  Object: an object of nested inter array
# =>  Side effect: none
# =>  Return value: an integer raised by one of nested inner array
# =>  Used return value?: Yes, determines a return value of #map method call
# => Line 182
# =>  Action: raising integer of each nested inner array object by one
# =>  Object: n/a
# =>  Side effect: none
# =>  Return value: an integer
# =>  Used return value?: Yes, determines return value of nested inner block

