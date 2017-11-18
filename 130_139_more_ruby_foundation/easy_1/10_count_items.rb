class MyClass
  def count(collection)
    counter = 0

    collection.each { |item| counter += 1 if yield(item) }

    counter
  end
end
