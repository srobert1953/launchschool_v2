class MyClass
  def count(collection)
    # => Solution 1
    # counter = 0
    # collection.each { |item| counter += 1 if yield(item) }
    # counter

    # => Solution 2
    collection.reduce(0) do |result, item|
      result += 1 if yield(item)
      result
    end
  end
end
